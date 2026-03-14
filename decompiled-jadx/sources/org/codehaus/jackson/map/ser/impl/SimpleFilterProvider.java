package org.codehaus.jackson.map.ser.impl;

import java.util.HashMap;
import java.util.Map;
import org.codehaus.jackson.map.ser.BeanPropertyFilter;
import org.codehaus.jackson.map.ser.FilterProvider;

/* JADX INFO: loaded from: classes.dex */
public class SimpleFilterProvider extends FilterProvider {
    protected BeanPropertyFilter _defaultFilter;
    protected boolean _cfgFailOnUnknownId = true;
    protected final Map<String, BeanPropertyFilter> _filtersById = new HashMap();

    public SimpleFilterProvider() {
    }

    public SimpleFilterProvider(Map<String, BeanPropertyFilter> mapping) {
    }

    public SimpleFilterProvider setDefaultFilter(BeanPropertyFilter f) {
        this._defaultFilter = f;
        return this;
    }

    public BeanPropertyFilter getDefaultFilter() {
        return this._defaultFilter;
    }

    public SimpleFilterProvider setFailOnUnknownId(boolean state) {
        this._cfgFailOnUnknownId = state;
        return this;
    }

    public boolean willFailOnUnknownId() {
        return this._cfgFailOnUnknownId;
    }

    public SimpleFilterProvider addFilter(String id, BeanPropertyFilter filter) {
        this._filtersById.put(id, filter);
        return this;
    }

    public BeanPropertyFilter removeFilter(String id) {
        return this._filtersById.remove(id);
    }

    @Override // org.codehaus.jackson.map.ser.FilterProvider
    public BeanPropertyFilter findFilter(Object filterId) {
        BeanPropertyFilter f = this._filtersById.get(filterId);
        if (f == null && (f = this._defaultFilter) == null && this._cfgFailOnUnknownId) {
            throw new IllegalArgumentException("No filter configured with id '" + filterId + "' (type " + filterId.getClass().getName() + ")");
        }
        return f;
    }
}
