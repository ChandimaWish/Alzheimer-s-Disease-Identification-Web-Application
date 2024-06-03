package com.sd.pms.app.repository;

import com.sd.pms.app.entity.reports.Comments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface CommentsRepository extends JpaRepository<Comments,Long> {
    ArrayList<Comments> findAllByAlReport_IdOrderByCreatedAtDesc(Long id);
}
