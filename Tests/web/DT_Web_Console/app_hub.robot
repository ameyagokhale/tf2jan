*** Settings ***

Suite Setup        SetupBrowsingEnv
Suite Teardown    DestroyBrowsingEnv
Resource          ../../../lib/web/WebLib.txt
Resource          ../../../lib/web/Ingestion/Ingestion_Config_UI.txt

*** Variables ***
${url}           ${baseurl}        # http://localhost:9090
${app_pkg_loc}    /home/aishwarya/tf2jan/apa/pi-demo-3.4.0.apa
${dt_version}    3.7.0
${apex_version}    3.6.0

*** Test Cases ***
#######AISHWARYAZ TCS###########
Apphub_download             #pass
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS to HDFS Line Copy
    ${AppPath}  Set Variable    //*[contains(text(),'HDFS to HDFS Line Copy')]
    Click Element   xpath= ${AppPath}             #click on an app
    Wait Until Page Contains    download
    Click Element   xpath=//*[contains(text(),'download')]                                              #download the app

Search_BY_Name
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing     //div//table/thead/tr[2]/td[1]/input      Sync


Search_BY_Desc
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing     //div//table/thead/tr[2]/td[2]/input      Ingest messages

Search_BY_Version
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing     //div//table/thead/tr[2]/td[3]/input      0.8

Search_BY_RequiresApex
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing     //div//table/thead/tr[2]/td[4]/input      3.4.0     true

Search_BY_Tags
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing     //div//table/thead/tr[2]/td[5]/input      hdfs



Search_BY_Name_Negative
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing_Negative      //div//table/thead/tr[2]/td[1]/input      randomword

Search_BY_Desc_Negative
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing_Negative      //div//table/thead/tr[2]/td[2]/input      randomword

Search_BY_Version_Negative
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing_Negative      //div//table/thead/tr[2]/td[3]/input      randomword

Search_BY_RequiresApex_Negative
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing_Negative      //div//table/thead/tr[2]/td[4]/input      randomword

Search_BY_Tags_Negative
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Search_Box_Testing_Negative      //div//table/thead/tr[2]/td[5]/input      randomword
    #Search_Box_Testing_Negative      //div//table/thead/    5      randomword


Check_App_Package_Details_Page
    Check_App_Package_Details_Page
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Click Element   xpath=//div/table//a[contains(text(),'Mobile Demo')]       #click on mobile demo
    Wait Until Page Contains    Mobile Demo
    Search_Box_Testing      //div//table/thead/tr[2]/td[1]/input     3.4.0    true #search by version
    Search_Box_Testing      //div//table/thead/tr[2]/td[2]/input     3.4.0      true    #search by RequiresApex
    Search_Box_Testing      //div//table/thead/tr[2]/td[3]/input     demo     true #search by Tags
    ${Import_Button}    Set Variable    //div/table//div/button[1]/t/span[contains(text(),'import')]
    Click Element   xpath=${Import_Button}
    ${status}=    Run Keyword And Return Status Page Should Contain     Re-Import
    Run Keyword If    ${status}
    ...    Click Element    xpath=//div/button[1][contains(text(),'Re-Import')]         #Added in 3.8 rts version
    Wait Until Page Contains    successfully imported.          timeout=30s
    ${Download_Button}    Set Variable     //div/table//div/a/t/span[contains(text(),'download')]
    Click Element   xpath=${Download_Button}

App_Hub_Without_Internet
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=//div/a/t[contains(text(),'check for updates')]
    Page should Contain     Your dtGateway does not have internet access.

Navigate_Using_Breadcrumb_Menu
    Connect_To_DT_Console    ${url}
    Connect_To_DT_Console    ${url}
    Go_To_Page  AppHub  AppHub
    Wait Until Page Contains     AppHub Packages
    Click Element   xpath=/html/body/div[2]/div/div[1]/label[2]     #listview button
    Wait Until Page Contains    HDFS
    Click Element   xpath=//div/table//a[contains(text(),'Mobile Demo')]       #click on mobile demo
    Wait Until Page Contains    Mobile Demo
    Click Element   xpath=//*[@id="breadcrumbs-top"]/li[2]/span/span/button
    sleep   5s
    Search_List_Testing      //*[@id="breadcrumbs-top"]/li[2]/span/span/ul/li[2]/form/input     Mobile   true
    Click Element       //*[@id="breadcrumbs-top"]/li[1]/a


########SHUBHAMZ TCS################

Navigate_To_AppHub       #pass
    Connect_To_DT_Console    ${url}
    Go_To_Page    Develop    AppHub Packages
    Capture Page Screenshot
    Click Element    //t[text()='AppHub Packages']/..
    Sleep    15s
    Capture Page Screenshot

Open_AppHub     #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot

Change_Of_View     #pass
    Connect_To_DT_Console    ${url}
    Sleep    15s
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[2]
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[1]
    Sleep    15s
    Capture Page Screenshot

Updates_Check_Grid    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//*[contains(text(),'check for updates')]    #xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s


No_Updates_Check_Grid     #PASSS
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s
    Wait Until Page Contains    no updated versions
    Capture Page Screenshot

Updates_Check_List     #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[2]
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s
    Capture Page Screenshot

No_Updates_Check_List     #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[2]
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s
    Wait Until Page Contains    no updated versions
    Capture Page Screenshot

Import_Updates_Grid    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s
    Capture Page Screenshot
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/table/tbody[3]/tr/td[4]/div/button[1]
    Sleep    150s
    Wait Until Page Contains    no updated versions
    Capture Page Screenshot

Download_Grid
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//div/a[contains(text(),'Pi Demo')]
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//*[contains(text(),'download')]    #xpath=/html/body/div[2]/div/h2/div/a    #//*[text()='download']
    Capture Page Screenshot
    Sleep    15s
    Capture Page Screenshot

Download_If_Update_Test    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//*[contains(text(),'check for updates')]    #xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s
    Capture Page Screenshot
    Wait Until Page Does Not Contain    no updated version
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[2]/div/table/tbody[3]/tr/td[4]/div/a    #//*[contains(text(),'download')]

Apphub_download    #pass
    Connect_To_DT_Console    ${url}
    Go_To_Page    AppHub    AppHub
    Wait Until Page Contains    AppHub Packages
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[2]    #listview button
    Wait Until Page Contains    HDFS to HDFS Line Copy
    ${AppPath}    Set Variable    //*[contains(text(),'HDFS to HDFS Line Copy')]
    Click Element    xpath= ${AppPath}    #click on an app
    Wait Until Page Contains    download
    Click Element    xpath=//*[contains(text(),'download')]

Import_from_AppHub_Grid    #importing pi demo    #partiallypass
    Connect_To_DT_Console    ${url}
    Sleep    15s
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[4]/div[1]/div/div/div[3]/div/div[2]/span/a[1]    #path of import button in pi demo
    Capture Page Screenshot
    Sleep    22s
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div
    Capture Page Screenshot

Import_from_AppHubPackage_Grid    #pass
    Connect_To_DT_Console    ${url}
    Sleep    15s
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//div/a[contains(text(),'Mobile Demo')]
    Wait Until Page Contains    Mobile Demo
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/h2/div/button[1]
    Capture Page Screenshot
   Click Element    xpath=/html/body/div[2]/div/h2/div/button[1]
    Capture Page Screenshot
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div    timeout=100s
    Capture Page Screenshot

Details_Of_AppPackage    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//div/a[contains(text(),'Pi Demo')]
    Wait Until Page Contains    Previous Version
    Capture Page Screenshot

Import_from_AppHubPackage_List    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[2]
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=//div/table//a[contains(text(),'Pi Demo')]
    Wait Until Page Contains    Pi Demo
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/h2/div/button[1]
    Capture Page Screenshot
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div    timeout=200s
    Capture Page Screenshot

Import_from_AppHub_List    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[1]/label[2]
    Sleep    15s
    Capture Page Screenshot
    ${Import_The_App_xpath}    Set Variable    //table//a[contains(text(),'Mobile Demo')]/../../td[6]//button    #For 2.0.0 Console : //table//a[contains(text(),'${app_name}')]/../../td[4]/button    For 2.1.0 Console: //table//a[contains(text(),'${app_name}')]/../../td[5]//button
    Click Element    xpath=${Import_The_App_xpath}
    #Click Element    xpath=//div/table//a[contains(text(),'Mobile Demo')]
    #Wait Until Page Contains    Pi Demo
    Capture Page Screenshot
    #Click Element    xpath=/html/body/div[2]/div/h2/div/button[1]
    #Capture Page Screenshot
    Wait Until Element Is Visible    xpath=/html/body/div[4]/div    timeout=100s
    Capture Page Screenshot

Search_BY_Name_Tile               #pass
    Connect_To_DT_Console    ${url}
    Go_To_Page    AppHub    AppHub Packages
    Wait Until Page Contains    AppHub Packages
    Sleep    15s
    Search_Box_Testing    /html/body/div[2]/div/div[2]/div[1]/form/input    hdfs
    Sleep    20s
    Capture Page Screenshot

Search_In_Updates_Check_Name    #pass
    Connect_To_DT_Console    ${url}
    Capture Page Screenshot
    Go_To_Page    AppHub    AppHub Packages
    Sleep    15s
    Capture Page Screenshot
    Click Element    xpath=/html/body/div[2]/div/div[2]/div[2]/a
    Sleep    15s
    Capture Page Screenshot
    Search_Box_Testing_Update    //div//table/thead/tr[2]/td[1]/input    sync
    Sleep    15s
    Capture Page Screenshot



*** Keywords ***