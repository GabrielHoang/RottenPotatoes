package com.hawwaru.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.uwetrottmann.tmdb2.Tmdb;
import com.uwetrottmann.tmdb2.entities.Movie;
import com.uwetrottmann.tmdb2.services.MoviesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import java.io.IOException;

@Component
public class JsonParser {

    @Autowired
    private Environment env;

    ObjectMapper mapper = new ObjectMapper();





}
