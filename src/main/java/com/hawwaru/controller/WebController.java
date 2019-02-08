package com.hawwaru.controller;

import com.hawwaru.comparators.CastMemberIdComparator;
import com.hawwaru.services.TmdbClientAuth;
import com.uwetrottmann.tmdb2.Tmdb;
import com.uwetrottmann.tmdb2.entities.*;
import com.uwetrottmann.tmdb2.enumerations.AppendToResponseItem;
import com.uwetrottmann.tmdb2.services.MoviesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import retrofit2.Response;

import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Controller
@PropertySource("classpath:persistence-mysql.properties")
public class WebController {

    Logger logger = Logger.getLogger(getClass().getName());

    @Autowired
    Environment env;

    //default display in US english
    private static Locale localeUS = new Locale.Builder().setLanguage("en").setRegion("US").build();

    //Date in YYYY-MM-DD format
    DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.DEFAULT);
    SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");

    NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeUS);


    String baseImgUrl = "https://image.tmdb.org/t/p/w200/";
    String baseYouTubeUrl = "https://www.youtube.com/embed/";

    int i;


//trying to get property this way will not work, it won't expose properties to the Spring Environment
//    Tmdb tmdb = new Tmdb(env.getProperty("themoviedb.apikey"));

    Tmdb tmdb = TmdbClientAuth.create();


    @GetMapping("/")
    public String showHome() {

        //logger.info("KEY: " + env.getProperty("themoviedb.apikey"));

        return "moviepage";
    }

    @GetMapping("/movie/{movieid}")
    public String showMovie(@PathVariable int movieid, Model model) {

        MoviesService moviesService = tmdb.moviesService();
        try {
            Response<Movie> response = moviesService
                    .summary(movieid,localeUS.getLanguage(),new AppendToResponse(AppendToResponseItem.CREDITS,AppendToResponseItem.VIDEOS))
                    .execute();
            if(response.isSuccessful()) {

                Movie movie = response.body();
                model.addAttribute("title", movie.original_title);
                model.addAttribute("tagline", movie.tagline);
                model.addAttribute("description",movie.overview);
                model.addAttribute("voteAverage",movie.vote_average);
                model.addAttribute("yearOfRelease", yearFormat.format(movie.release_date));
                model.addAttribute("releaseDate",dateFormatter.format(movie.release_date));
                model.addAttribute("budget",currencyFormatter.format(movie.budget));
                model.addAttribute("revenue", currencyFormatter.format(movie.revenue));
                model.addAttribute("duration", movie.runtime);
                //TODO parametrize width of the retrieved picture
                model.addAttribute("posterPath",  baseImgUrl+movie.poster_path);

                //some of the entities have lists as attributes
                List<String> productionCountries = new ArrayList<>();
                for (Country country : movie.production_countries) {
                    productionCountries.add(country.name);
                }
                model.addAttribute("productionCountries", productionCountries);

                List<String> genres = new ArrayList<>();
                for(Genre genre : movie.genres) {
                    genres.add(genre.name);
                }
                model.addAttribute("genres", genres);

                List<String> prodCompanies = new ArrayList<>();
                for(BaseCompany company : movie.production_companies) {
                    prodCompanies.add(company.name);
                }
                model.addAttribute("productionCompanies", prodCompanies);

                //cast
                //add urlBase to profile picture path
                List<CastMember> castMembers = new ArrayList<>();
                for(CastMember member : movie.credits.cast) {
                    member.setProfile_path(baseImgUrl+member.profile_path);
                    castMembers.add(member);
                }
                castMembers.sort(new CastMemberIdComparator());
                model.addAttribute("castMembers", castMembers);

                //crew members are sorted by their job for visibility
                Map<String, List<CrewMember>> crewMembers =
                        movie.credits.crew.stream().collect(Collectors.groupingBy(c -> c.job));
                model.addAttribute("crewMemebers", crewMembers);

                //group videos by site and add YouTube url in front of the video key
                Map<String, List<Videos.Video>> videos =
                        movie.videos.results.stream().collect(Collectors.groupingBy(
                                        v -> {
                                            if(v.site.equals("YouTube")){v.key = baseYouTubeUrl+v.key; }
                                            return v.site;
                                        }
                                        ));
                model.addAttribute("youtubeVideos", videos);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "moviepage";
    }
}
