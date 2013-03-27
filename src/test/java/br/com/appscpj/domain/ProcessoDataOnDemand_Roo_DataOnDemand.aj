// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.appscpj.domain;

import br.com.appscpj.dao.ProcessoDao;
import br.com.appscpj.domain.Advogado;
import br.com.appscpj.domain.AdvogadoDataOnDemand;
import br.com.appscpj.domain.Parte;
import br.com.appscpj.domain.ParteDataOnDemand;
import br.com.appscpj.domain.Processo;
import br.com.appscpj.domain.ProcessoDataOnDemand;
import br.com.appscpj.service.ProcessoService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProcessoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProcessoDataOnDemand: @Component;
    
    private Random ProcessoDataOnDemand.rnd = new SecureRandom();
    
    private List<Processo> ProcessoDataOnDemand.data;
    
    @Autowired
    AdvogadoDataOnDemand ProcessoDataOnDemand.advogadoDataOnDemand;
    
    @Autowired
    ParteDataOnDemand ProcessoDataOnDemand.parteDataOnDemand;
    
    @Autowired
    ProcessoService ProcessoDataOnDemand.processoService;
    
    @Autowired
    ProcessoDao ProcessoDataOnDemand.processoDao;
    
    public Processo ProcessoDataOnDemand.getNewTransientProcesso(int index) {
        Processo obj = new Processo();
        setAdvogado(obj, index);
        setDataAbertura(obj, index);
        setDataEncerramento(obj, index);
        setNumero(obj, index);
        setParte(obj, index);
        setStatus(obj, index);
        setTipoProcesso(obj, index);
        return obj;
    }
    
    public void ProcessoDataOnDemand.setAdvogado(Processo obj, int index) {
        Advogado advogado = advogadoDataOnDemand.getSpecificAdvogado(index);
        obj.setAdvogado(advogado);
    }
    
    public void ProcessoDataOnDemand.setDataAbertura(Processo obj, int index) {
        Date dataAbertura = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDataAbertura(dataAbertura);
    }
    
    public void ProcessoDataOnDemand.setDataEncerramento(Processo obj, int index) {
        Date dataEncerramento = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDataEncerramento(dataEncerramento);
    }
    
    public void ProcessoDataOnDemand.setNumero(Processo obj, int index) {
        String numero = "numero_" + index;
        obj.setNumero(numero);
    }
    
    public void ProcessoDataOnDemand.setParte(Processo obj, int index) {
        Parte parte = parteDataOnDemand.getSpecificParte(index);
        obj.setParte(parte);
    }
    
    public void ProcessoDataOnDemand.setStatus(Processo obj, int index) {
        String status = "status_" + index;
        obj.setStatus(status);
    }
    
    public void ProcessoDataOnDemand.setTipoProcesso(Processo obj, int index) {
        String tipoProcesso = "tipoProcesso_" + index;
        obj.setTipoProcesso(tipoProcesso);
    }
    
    public Processo ProcessoDataOnDemand.getSpecificProcesso(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Processo obj = data.get(index);
        Long id = obj.getId();
        return processoService.findProcesso(id);
    }
    
    public Processo ProcessoDataOnDemand.getRandomProcesso() {
        init();
        Processo obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return processoService.findProcesso(id);
    }
    
    public boolean ProcessoDataOnDemand.modifyProcesso(Processo obj) {
        return false;
    }
    
    public void ProcessoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = processoService.findProcessoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Processo' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Processo>();
        for (int i = 0; i < 10; i++) {
            Processo obj = getNewTransientProcesso(i);
            try {
                processoService.saveProcesso(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            processoDao.flush();
            data.add(obj);
        }
    }
    
}
