package com.hawwaru.services;

import com.uwetrottmann.tmdb2.Tmdb;

public class TmdbClientUnAuth extends TmdbAuthenticationAbstract {

    private TmdbClientUnAuth () {};

    public Tmdb create() {
        return getUnauthenticatedInstance();
    }
}
