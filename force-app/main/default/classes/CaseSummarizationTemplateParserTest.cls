@isTest
private class CaseSummarizationTemplateParserTest {
    @isTest
    static void testParseTemplate() {
        List<String> jsonInputs = new List<String>{
            '{"caseType":"Mechanical", "reason":"Mechanical Issue", "summary":"Customer reported mechanical problem" }',
            '{"caseType":"Electrical", "reason":"Electrical Issue", "summary":"Customer reported electrical problem" }'
        };

        Test.startTest(); 
        List<CaseSummarizationTemplateParser.CaseSummary> results = CaseSummarizationTemplateParser.parseTemplate(jsonInputs);
        Test.stopTest();

        System.assertEquals(2, results.size(), 'Should have parsed 2 case summaries');

        System.assertEquals('Mechanical', results[0].CaseType, 'First case type should be Mechanical');
        System.assertEquals('Mechanical Issue', results[0].Reason, 'First case reason should be Mechanical Issue');
        System.assertEquals('Customer reported mechanical problem', results[0].Summary, 'First case summary should be Customer reported mechanical problem');

        System.assertEquals('Electrical', results[1].CaseType, 'Second case type should be Electrical');
        System.assertEquals('Electrical Issue', results[1].Reason, 'Second case reason should be Electrical Issue');
        System.assertEquals('Customer reported electrical problem', results[1].Summary, 'Second case summary should be Customer reported electrical problem');
    }

    @IsTest
    static void testParseTemplateEmptyInput() {
        List<String> emptyInput = new List<String>(); 
        Test.startTest();
        List<CaseSummarizationTemplateParser.CaseSummary> results = CaseSummarizationTemplateParser.parseTemplate(emptyInput); 
        Test.stopTest();

        System.assertEquals(0, results.size(), 'Should return an empty list');
    }

    @IsTest
    static void testParseTemplateInvalidJson() {
        List<String> invalidJsonInput = new List<String>{'Not valid JSON'};

        Test.startTest();
        try {
            CaseSummarizationTemplateParser.parseTemplate(invalidJsonInput);
            System.assert(false, 'Should have thrown an exception for invalid JSON');
        } catch (JSONException e) {
            System.assert(true, 'Correctly threw JSONException for invalid input');
        }
        Test.stopTest();
    }
}