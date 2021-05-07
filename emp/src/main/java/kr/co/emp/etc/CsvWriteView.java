package kr.co.emp.etc;

import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.servlet.view.AbstractView;
import org.supercsv.io.CsvMapWriter;
import org.supercsv.io.ICsvMapWriter;
import org.supercsv.prefs.CsvPreference;
 

public class CsvWriteView extends AbstractView {

	@Override
    protected void renderMergedOutputModel(Map<String, Object> modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
 
        response.setContentType("text/csv; charset=MS949");
        response.setHeader("Content-Disposition", "attachment; filename=\"excelCsv.csv\"");
 
        excelDataPurification(modelMap, request, response);
    }

    protected void excelDataPurification(Map<String, Object> modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

        ICsvMapWriter csvMapWriter = new CsvMapWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
 
        String columnIds = (String) modelMap.get("columnIds");
        String columnNames = (String) modelMap.get("columnNames");
 
        String[] colids = columnIds.split(",");
        String[] colnms = columnNames.split(",");
 
        List<Map<String, Object>> excelDataList = (List<Map<String, Object>>) modelMap.get("excelDataList");
 
        csvMapWriter.writeHeader(colnms);
 
        for (int i = 0; i < excelDataList.size(); i++) {
                Map<String, Object> rowData = (Map<String, Object>) excelDataList.get(i);
                csvMapWriter.write(rowData, colids);
        }
        
        csvMapWriter.close();
    }

	
}
