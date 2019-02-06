package com.hawwaru.services;

import com.uwetrottmann.tmdb2.Tmdb;

public class TmdbClientAuth extends TmdbAuthenticationAbstract{

    private TmdbClientAuth () {}

    public static Tmdb create() {
        return getAuthenticatedInstance();
    }

}
