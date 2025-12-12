package com.ptithcm.intern_project.service.files;

import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import lombok.NonNull;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class ExcelHelper {

    private static Object[][] readXlsExcel(MultipartFile file) {
        try(InputStream inpStream = file.getInputStream()) {
            jxl.Workbook workbook = jxl.Workbook.getWorkbook(inpStream);

            jxl.Sheet sheet = workbook.getSheet(0);
            int rows = sheet.getRows();
            int columns = sheet.getColumns();
            Object[][] data = new Object[rows][columns];

            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < columns; j++) {
                    data[i][j] = sheet.getCell(j, i).getContents();
                }
            }
            return data;
        } catch (Exception e) {
            throw new RuntimeException("Error reading Excel file: " + e.getMessage(), e);
        }
    }

    private static Object[][] readXlsxExcel(MultipartFile file) {
        try (InputStream inputStream = file.getInputStream()) {
            var workbook = org.apache.poi.ss.usermodel.WorkbookFactory.create(inputStream);

            org.apache.poi.ss.usermodel.Sheet sheet = workbook.getSheetAt(0);
            int rows = sheet.getPhysicalNumberOfRows();
            int columns = sheet.getRow(0).getPhysicalNumberOfCells();
            List<Object[]> data = new ArrayList<>();

            for (int i = 0; i < rows; i++) {
                Object[] temp = new Object[columns];
                Row row = sheet.getRow(i);
                for (int j = 0; j < columns; j++) {
                    Cell cell = row.getCell(j);
                    if (cell != null && !cell.toString().isEmpty()) {
                        temp[j] = cell;
                    }
                }
                if (!Arrays.stream(temp).allMatch(Objects::isNull))
                    data.add(temp);
            }
            return data.toArray(new Object[data.size()][]);
        } catch (Exception e) {
            throw new RuntimeException("Error reading Excel file: " + e.getMessage(), e);
        }
    }

    public static Object[][] readExcel(@NonNull MultipartFile file) {
        var fileName = file.getOriginalFilename();
        if (fileName == null)   throw new AppExc(ErrorCodes.INVALID_FILE);

        if (fileName.toLowerCase().endsWith("xls"))
            return readXlsExcel(file);

        if (fileName.toLowerCase().endsWith(".xlsx"))
            return readXlsxExcel(file);

        return new Object[0][0];
    }
}
