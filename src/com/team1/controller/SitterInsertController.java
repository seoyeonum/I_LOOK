/*===============================
    sitterInsertController.java
=============================== */

package com.team1.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
public class SitterInsertController
{
    @Autowired
    private SqlSession sqlSession;

    @Transactional
    @RequestMapping(value = "/sitterInsert.action", method = RequestMethod.POST)
    public String sitterInsert(SitDTO sitter,
    							@RequestParam("sitPhoto") MultipartFile sitPhoto,
                                @RequestParam("healthCert") MultipartFile healthCert,
                                @RequestParam("crimeRecord") MultipartFile crimeRecord,
                                @RequestParam(value = "certificates", required = false) List<MultipartFile> certificates,
                                @RequestParam(value = "certTypeIds", required = false) List<String> certTypeIds,
                                HttpServletRequest request,
                                Model model) throws IllegalStateException, IOException
    {
        // 👉 로그 출력: 시작 확인
        System.out.println("▶ 시터 회원가입 컨트롤러 진입");

        // 0. DAO 연결
        ISitDAO sitdao = sqlSession.getMapper(ISitDAO.class);
        IDocRegDAO docdao = sqlSession.getMapper(IDocRegDAO.class);
        ISitCertDAO certdao = sqlSession.getMapper(ISitCertDAO.class);

		// 1. SIT_BACKUP 등록 → sit_backup_id 자동 생성
        sitdao.addBackup(sitter);
        
        // 👉 로그 출력: 생성된 sit_backup_id 확인
        System.out.println("▶ SIT_REG_ID: " + sitter.getSit_backup_id());
        
        // 현재 등록된 시터의 백업 코드
        String sitBackupId = sitter.getSit_backup_id();
        
        
        // 2. 파일 저장 경로
        String uploadPathPics = request.getServletContext().getRealPath("/images/pictures");			// 저장경로 - 시터사진
        String uploadPathDoc = request.getServletContext().getRealPath("/images/documents");			// 저장경로 - 검증서류
        String uploadPathCert = request.getServletContext().getRealPath("/images/certificates");		// 저장경로 - 자격증

        
        // 3. 시터 사진 저장 및 경로 (SIR_REG 의 FILE_PATH)
    	String originalPhotoName = sitPhoto.getOriginalFilename();						// 원본 파일명 (확장자 포함)
    	String extensionPhoto = "";
    	if (originalPhotoName != null && originalPhotoName.contains("."))
    	{
    		extensionPhoto = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));		// 확장자 추출 (.jpg)
    	}
    	String filePhotoName = "sit_photo_" + sitBackupId + extensionPhoto;				// 저장할 파일명 조합
    	
        File filePhoto = new File(uploadPathPics, filePhotoName);						// 파일 객체 생성
        sitPhoto.transferTo(filePhoto);													// (서버에) 파일 저장
        System.out.println("▶ 시터 사진 저장 경로: " + filePhoto.getAbsolutePath());
        
        													//-- 시터 파일 저장 경로
        sitter.setFile_path(filePhotoName);
        

        
        // 4. SIT_REG 등록 → sit_reg_id 자동 생성
        sitdao.add(sitter);
        
        // 👉 로그 출력: 생성된 sit_reg_id 확인
        System.out.println("▶ SIT_REG_ID: " + sitter.getSit_reg_id());
        
        
        // 5-1. 보건증 업로드 (DOC_TYPE_ID: "001")
        String originalHealthCertName = healthCert.getOriginalFilename();						// 원본 파일명 (확장자 포함)
    	String extensionHealthCert = "";
    	if (originalHealthCertName != null && originalHealthCertName.contains("."))
    	{
    		extensionHealthCert = originalHealthCertName.substring(originalHealthCertName.lastIndexOf("."));		// 확장자 추출 (.jpg)
    	}
    	String fileHealthCertName = "sit_healthcert_" + sitBackupId + extensionHealthCert;				// 저장할 파일명 조합
        File fileHealthCert = new File(uploadPathDoc, fileHealthCertName);
        healthCert.transferTo(fileHealthCert);

        DocRegDTO doc001 = new DocRegDTO();
        doc001.setDoc_type_id("001");
        doc001.setSit_reg_id(sitter.getSit_reg_id());
        doc001.setFile_path(fileHealthCertName);
        docdao.addDoc(doc001);
        System.out.println("▶ 보건증 저장 경로: " + fileHealthCert.getAbsolutePath());


        // 5-2. 범죄이력 업로드 (DOC_TYPE_ID: "002")
        String originalcrimeRecordName = crimeRecord.getOriginalFilename();					// 원본 파일명 (확장자 포함)
    	String extensioncrimeRecord = "";
    	if (originalcrimeRecordName != null && originalcrimeRecordName.contains("."))
    	{
    		extensioncrimeRecord = originalcrimeRecordName.substring(originalcrimeRecordName.lastIndexOf("."));		// 확장자 추출 (.jpg)
    	}
    	String filecrimeRecordName = "sit_crimerecord_" + sitBackupId + extensioncrimeRecord;					// 저장할 파일명 조합
        File filecrimeRecord = new File(uploadPathDoc, filecrimeRecordName);
        crimeRecord.transferTo(filecrimeRecord);

        DocRegDTO doc002 = new DocRegDTO();
        doc002.setDoc_type_id("002");
        doc002.setSit_reg_id(sitter.getSit_reg_id());
        doc002.setFile_path(filecrimeRecordName);
        docdao.addDoc(doc002);


        // 5-3. 자격증 업로드 (선택, 다건)
        if (certificates != null && !certificates.isEmpty())
        {
        	// 자격증 타입 설정을 하지 않았다면 → 기본값(005) 사용
            if (certTypeIds == null || certTypeIds.isEmpty())
            {
                certTypeIds = new ArrayList<>();
                
                for (int i = 0; i < certificates.size(); i++)
                {
                    certTypeIds.add("005"); 											// 기타 자격증으로 기본 설정
                }
            }
            
            for (int i = 0; i < certificates.size(); i++)
            {
                MultipartFile certFile = certificates.get(i);
                String certTypeId;
                
                // 유형 ID가 있으면 사용, 없으면 기본값 "105"(기타 자격증) 사용
                if (i < certTypeIds.size())
                {
                    certTypeId = certTypeIds.get(i);
                }
                else
                {
                    certTypeId = "105"; // 기타 자격증으로 기본 설정
                }

                if (!certFile.isEmpty())
                {
                	String originalName = certFile.getOriginalFilename();						// 원본 파일명 (확장자 포함)
                	String extension = "";
                	if (originalName != null && originalName.contains("."))
                	{
                		extension = originalName.substring(originalName.lastIndexOf("."));		// 확장자 추출 (.jpg)
                	}
                	String fileName = "sit_cert_" + certTypeId + "_" + sitBackupId + extension;	// 저장할 파일명 조합
                    File file = new File(uploadPathCert, fileName);
                    certFile.transferTo(file);

                    SitCertDTO cert = new SitCertDTO();
                    cert.setCert_type_id(certTypeId); // 사용자 선택
                    cert.setSit_reg_id(sitter.getSit_reg_id());
                    cert.setFile_path(fileName);
                    certdao.addCert(cert);
                }
            }
        }

        // 6. 완료 후 로그인 페이지 또는 메인 페이지 이동
        return "redirect:/iLook.action?sitterinsert=success";
        
    }
}
