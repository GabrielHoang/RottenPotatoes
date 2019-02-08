package com.hawwaru.comparators;

import com.uwetrottmann.tmdb2.entities.CastMember;

import java.util.Comparator;

public class CastMemberIdComparator implements Comparator<CastMember> {
    @Override
    public int compare(CastMember o1, CastMember o2) {
        return (o1.getCast_id() - o2.getCast_id());
    }
}
