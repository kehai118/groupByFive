package com.second.pojo;

import java.io.Serializable;

public class TGroupNubers extends TGroupNubersKey implements Serializable {
    private String role;

    private static final long serialVersionUID = 1L;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", role=").append(role);
        sb.append("]");
        return sb.toString();
    }
}