package com.second.pojo.note;

import java.io.Serializable;

import java.sql.Clob;
import java.util.Arrays;
import java.util.Date;
import java.util.Objects;

/**
 * T_ARTICLE
 * @author 
 */
public class TArticle implements Serializable {
    private Long id;

    private Long authorId;

    private String title;

    private Long isshare;

    private Long peeks;

    private Long likes;

    private Long dislikes;

    private Date createAt;

    private Date lastUpdateTime;

    private String article;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Long authorId) {
        this.authorId = authorId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getIsshare() {
        return isshare;
    }

    public void setIsshare(Long isshare) {
        this.isshare = isshare;
    }

    public Long getPeeks() {
        return peeks;
    }

    public void setPeeks(Long peeks) {
        this.peeks = peeks;
    }

    public Long getLikes() {
        return likes;
    }

    public void setLikes(Long likes) {
        this.likes = likes;
    }

    public Long getDislikes() {
        return dislikes;
    }

    public void setDislikes(Long dislikes) {
        this.dislikes = dislikes;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TArticle tArticle = (TArticle) o;
        return Objects.equals(id, tArticle.id) &&
                Objects.equals(authorId, tArticle.authorId) &&
                Objects.equals(title, tArticle.title) &&
                Objects.equals(isshare, tArticle.isshare) &&
                Objects.equals(peeks, tArticle.peeks) &&
                Objects.equals(likes, tArticle.likes) &&
                Objects.equals(dislikes, tArticle.dislikes) &&
                Objects.equals(createAt, tArticle.createAt) &&
                Objects.equals(lastUpdateTime, tArticle.lastUpdateTime) &&
                Objects.equals(article, tArticle.article);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, authorId, title, isshare, peeks, likes, dislikes, createAt, lastUpdateTime, article);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", authorId=").append(authorId);
        sb.append(", title=").append(title);
        sb.append(", isshare=").append(isshare);
        sb.append(", peeks=").append(peeks);
        sb.append(", likes=").append(likes);
        sb.append(", dislikes=").append(dislikes);
        sb.append(", createAt=").append(createAt);
        sb.append(", lastUpdateTime=").append(lastUpdateTime);
        sb.append(", article=").append(article);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}