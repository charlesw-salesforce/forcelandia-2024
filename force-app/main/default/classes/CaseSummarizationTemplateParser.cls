public class CaseSummarizationTemplateParser {
  @InvocableMethod(
    label='Parse Case Summary' 
    description='Parses case summaries from the Summarize and Classify prompt template')
  public static List<CaseSummary> parseTemplate(List<String> categoryJsonString) {
    List<CaseSummary> caseSummaries = new List<CaseSummary>();
    for (String str : categoryJsonString) {
      CaseSummary c = (CaseSummary) JSON.deserialize(str, CaseSummary.class);
      caseSummaries.add(c);
  }
  return caseSummaries;
 }
 
 public class CaseSummary {
  @InvocableVariable
  public String caseType;
  @InvocableVariable
  public String reason; 
  @InvocableVariable
  public String summary;
  }
}