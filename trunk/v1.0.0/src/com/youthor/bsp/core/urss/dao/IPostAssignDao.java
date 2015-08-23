package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.urss.model.PostAssign;

public interface IPostAssignDao {

    PostAssign getPostAssign(String orgId, String postId);

    String addPostAssign(PostAssign postAssign);

    String updatePostAssign(PostAssign postAssign);

    List getPostAssignsByOrgId(String orgId);

    boolean deletePostAssignByIds(String[] assignIds);

    PostAssign getpostAssignWithOrgsById(String assignId);

}
