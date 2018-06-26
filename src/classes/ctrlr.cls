public class TERF_Controller_EditMR{

    public String getRi() {
        return null;
    }


    public TERF_MR__c MR {get; private set;}
    public TERF_RI__c report {get;set;}

    public TERF_Controller_EditMR() {
        MR = [select Id, Name, TERF_MR_year__c, TERF_MR_month__c,
                TERF_MR_employee__r.TERF_Emp_FirstName__c, TERF_MR_employee__r.TERF_Emp_SecondName__c, TERF_MR_RIcount__c,
                TERF_MR_employee__r.TERF_Emp_CompanyName__c, TERF_MR_employee__r.TERF_Emp_CompanyAlias__c,
                TERF_MR_TaxCount__c, TERF_MR_CarCount__c, TERF_MR_BTcount__c, TERF_MR_MeetingCount__c, TERF_MR_ConfCount__c, TERF_MR_PresentCount__c, TERF_MR_PartListCount__c,
        (select Id, Name, TERF_RI_type__c, TERF_RI_disable__c, TERF_RI_Country__c, TERF_RI_Description__c, TERF_RI_PresentGoal__c, TERF_RI_startDate__c, TERF_RI_endDate__c,
                TERF_RI_city__c, TERF_RI_place__c, TERF_RI_Car__r.TERF_Car_Model__c, TERF_RI_Car__r.TERF_Car_manufacture__c, TERF_RI_Car__r.TERF_Car_Number__c,
                TERF_RI_ConferenceName__c from TERF_RI__r)
        from TERF_MR__c where id=:ApexPages.currentPage().getParameters().get('id')];
        report = new TERF_RI__c();
    }

    public PageReference gotoRU_TERs_Home()
    {
        return new PageReference('/apex/TERF_Home');
    }

//ДОБАВИТЬ КОНФЕРЕНЦИЮ
    public pageReference AddConf()
    {
        report.TERF_RI_Type__c = 'Конфереsнцfefeия';
        report.TERF_RI_MR__c = MR.Id;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TERF_EditConf');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }



//ДОБАВИТЬ КОМАНДИРОВКУ
    public pageReference AddBT()
    {
        report.TERF_RI_Type__c = 'Командировка';
        report.TERF_RI_Company__c = MR.TERF_MR_employee__r.TERF_Emp_CompanyAlias__c;
        report.TERF_RI_MR__c = MR.Id;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TERF_EditBT');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }



//ДОБАВИТЬ ПРЕДСТАВИТЕЛЬСКИЕ
    public pageReference AddMeeting()
    {
        report.TERF_RI_Type__c = 'Представительские расходы';
        report.TERF_RI_Company__c = MR.TERF_MR_employee__r.TERF_Emp_CompanyAlias__c;
        report.TERF_RI_MR__c = MR.Id;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TERF_EditMeeting');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }


//ДОБАВИТЬ ЗАЯВЛЕНИЕs
    public pageReference AddTax()
    {
        report.TERF_RI_Type__c = 'Заявление';
        report.TERF_RI_MR__c = MR.Id;
        report.TERF_RI_Company__c = report.TERF_RI_MR__r.TERF_MR_employee__r.TERF_Emp_CompanyAlias__c;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TrrrrrrERF_EditTax');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }


//ДОБАВИТЬ ПУТЕВОЙ
    public pageReference AddCar()
    {
        report.TERF_RI_Type__c = 'Путевой лист';
        report.TERF_RI_MR__c = MR.Id;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TERF_EditCar');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }


//ДОБАВИТЬ ПОДАРКИ
    public pageReference AddPresent()
    {
        report.TERF_RI_Type__c = 'Подарки';
        report.TERF_RI_MR__c = MR.Id;
        report.TERF_RI_Company__c = report.TERF_RI_MR__r.TERF_MR_employee__r.TERF_Emp_CompanyAlias__c;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TERF_EditPresent');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }



//ДОБАВИТЬ СПИСОК УЧАСТНИКОВ
    public pageReference AddPartList()
    {
        report.TERF_RI_Type__c = 'Список участников';
        report.TERF_RI_MR__c = MR.Id;
        report.TERF_RI_Company__c = report.TERF_RI_MR__r.TERF_MR_employee__r.TERF_Emp_CompanyAlias__c;
        insert report;
        report = [select Id, Name, TERF_RI_Type__c, TERF_RI_MR__c from TERF_RI__c where id=: report.Id];
        PageReference pageRef = new PageReference('/apex/TERF_EditPartList');
        pageRef.getParameters().put('id',report.Id);
        return pageRef;
    }



}