/*===============================
    sitterInsertController.java
=============================== */

package com.team1.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team1.dto.DocRegDTO;
import com.team1.dto.SitCertDTO;
import com.team1.dto.SitDTO;
import com.team1.mybatis.IDocRegDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.ISitDAO;

@Controller
public class sitterInsertController
{
    @Autowired
    private SqlSession sqlSession;

    @Transactional
    @RequestMapping(value = "/sitterInsert.action", method = RequestMethod.POST)
    public String sitterInsert(SitDTO sitter,
                                @RequestParam("healthCert") MultipartFile healthCert,
                                @RequestParam("crimeRecord") MultipartFile crimeRecord,
                                @RequestParam(value = "certificates", required = false) List<MultipartFile> certificates,
                                @RequestParam(value = "cert_type_ids", required = false) List<String> certTypeIds,
                                HttpServletRequest request,
                                Model model)
    {
        // 👉 로그 출력: 시작 확인
        System.out.println("▶ 시터 회원가입 컨트롤러 진입");

        // DAO 연결
        ISitDAO sitdao = sqlSession.getMapper(ISitDAO.class);
        IDocRegDAO docdao = sqlSession.getMapper(IDocRegDAO.class);
        ISitCertDAO certdao = sqlSession.getMapper(ISitCertDAO.class);

        // 1. SIT_BACKUP 등록 → sit_backup_id 자동 생성
        sitdao.addBackup(sitter);

        // 2. SIT_REG 등록 → sit_reg_id 자동 생성
        sitdao.add(sitter);

        // 👉 로그 출력: 생성된 sit_reg_id 확인
        System.out.println("▶ SIT_REG_ID: " + sitter.getSit_reg_id());

        // 3. 파일 저장 경로
        String uploadPath = request.getServletContext().getRealPath("/resources/uploads");

        // 4. 보건증 업로드 (DOC_TYPE_ID: "001")
        try {
            String fileName = UUID.randomUUID() + "_" + healthCert.getOriginalFilename();
            File file = new File(uploadPath, fileName);
            healthCert.transferTo(file);

            DocRegDTO doc = new DocRegDTO();
            doc.setDoc_type_id("001");
            doc.setSit_reg_id(sitter.getSit_reg_id());
            doc.setFile_path("/uploads/" + fileName);
            docdao.addDoc(doc);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 5. 범죄이력 업로드 (DOC_TYPE_ID: "002")
        try {
            String fileName = UUID.randomUUID() + "_" + crimeRecord.getOriginalFilename();
            File file = new File(uploadPath, fileName);
            crimeRecord.transferTo(file);

            DocRegDTO doc = new DocRegDTO();
            doc.setDoc_type_id("002");
            doc.setSit_reg_id(sitter.getSit_reg_id());
            doc.setFile_path("/uploads/" + fileName);
            docdao.addDoc(doc);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 6. 자격증 업로드 (선택, 다건)
        if (certificates != null && certTypeIds != null && certificates.size() == certTypeIds.size())
        {
            for (int i = 0; i < certificates.size(); i++)
            {
                MultipartFile certFile = certificates.get(i);
                String certTypeId = certTypeIds.get(i);

                if (!certFile.isEmpty())
                {
                    try {
                        String fileName = UUID.randomUUID() + "_" + certFile.getOriginalFilename();
                        File file = new File(uploadPath, fileName);
                        certFile.transferTo(file);

                        SitCertDTO cert = new SitCertDTO();
                        cert.setCert_type_id(certTypeId); // 사용자 선택
                        cert.setSit_reg_id(sitter.getSit_reg_id());
                        cert.setFile_path("/uploads/" + fileName);
                        certdao.addCert(cert);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        // 7. 완료 후 로그인 페이지 또는 메인 페이지 이동
        return "redirect:/iLook.action";
        //return "redirect:/iLook.action?joined=true";
    }

}
