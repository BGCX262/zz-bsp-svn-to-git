package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.Subassembly;

public interface ISubassemblyDao {

    List getAllSubassembly();

    Subassembly getSubassemblyById(String subassemblyId);

    String addSubassembly(Subassembly subassembly);

    void updateSubassembly(Subassembly subassembly);

}
