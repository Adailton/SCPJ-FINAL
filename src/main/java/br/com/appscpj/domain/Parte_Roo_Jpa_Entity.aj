// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.appscpj.domain;

import br.com.appscpj.domain.Parte;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Parte_Roo_Jpa_Entity {
    
    declare @type: Parte: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Parte.id;
    
    @Version
    @Column(name = "version")
    private Integer Parte.version;
    
    public Long Parte.getId() {
        return this.id;
    }
    
    public void Parte.setId(Long id) {
        this.id = id;
    }
    
    public Integer Parte.getVersion() {
        return this.version;
    }
    
    public void Parte.setVersion(Integer version) {
        this.version = version;
    }
    
}