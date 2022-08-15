# PowerBIHybridTables

This repository is a companion repository of demonstrations that support the presentation [Power BI Incremental Refresh and Hybrid Tables](https://microsoft.github.io/PartnerResources/skilling/modern-analytics-academy/vignettes/power-bi-hybrid-tables).  In this repository you'll find:
1. SQL Scripts to recreate the AdventureWorksDW Database
1. SQL Scripts to alter the AdventureWorksDW Database for usage with the Power BI concepts of Incremental Refresh and Hybrid Tables.
1. Power BI Templates with prebuilt models and reports inllustrating these features.
1. Instructions on how to deploy this in your own environment.

## Preqrequisites
This solution is built upon a combination of Power BI and Azure SQL Database therefore to leverage the code you must have access to the following:
1. A Power BI Pro Subscription (Note: if you do not currently have Power BI Pro you can sign up for a 60 day trial).
1. Access to an Azure Subscription where you can create an Azure SQL Database.
1. A machine with Power BI Desktop to open, configure, and deploy the models.

## Azure SQL Database Setup
In this section we'll setup the Azure SQL Database.

### Part 1 - Provision the Azure SQL Database
1. Navigate to the [Azure Portal](https://portal.azure.com) and login.
1. Select "Create a resource". 

    ![create a resource](/Images/01-createaresource.png)
1. In the search box type "sql azure" and press enter.

    ![azure sql](/Images/02-search.png)

1. Click "Create" for the Azure SQL Resource.

    ![Azure SQL](/Images/03-azuresql.png)

1. Select the Resource Type "Single database" and click "Create"

    ![single database](/Images/04-singledatabase.png)
1. Enter and make note of the properties for:
    * Resource Group
    * Database Name
    * Server
    * Password
1. Click "Review and Create".
1. Click "Create".
1. You'll be presented with a progress screen.

    ![deployment in progress](/Images/05-deployment.png)
1. Once the databse is done provisioning click "Go to Resource".

### Part 2 - Configure the Server firewall
1. By default databases are not externally accessible.  Click "Set server firewall" to change access settings.

    ![set firewall](/Images/06-setfirewall.png)
1. Choose "Selected Networks"
1. Click "Add your client IPv4 address..."
1. Check "Allow Azure services and resource to access this server".
1. Click "Save".

### Part 3 - configure the database
1. Navigate to the query editor.

    ![query editor](/Images/07-queryeditor.png)
1. Provide your login credentials and click "OK".

    ![login](/Images/08-login.png)
1. Copy the contents of 01 - Create AdventureWorksDW.sql from the scripts folder and click "Run".

    ![run](/Images/09-run.png)
1. Repeat the last step for scripts 02 - Populate dimDate.sql and 03 - Shift FactInternetSalesDates.sql paying close attention to the instructions for the dates.  (Note: the script in its current form should work fine through the end of 2023, but will need attention in 2024).

## Power BI Setup
Now that the databse is properly configured, you can setup the Power BI Components.

### Part 1 - Setup in PowerBI.com
1. Navigate to [Power BI](https://www.powerbi.com) and login.
2. Create a new workspace.

### Part 2 - Open and Deploy Power BI Template
1. Open PowerBIIncrementalRefresh.pbit.
1. When prompted to provide data be sure to enter the ServerName and Database name that you used when configuring the sql server, and click "Load".
1. You must also provide RangeStart and RangeEnd values.  Good values for this are 1/1/2021 and 1/1/2022 respectively.

    ![Load](/Images/10-load.png)
1. When promped enter your databse username and password and click "Connect".

    ![Credentials](/Images/11-credentials.png)
1. Data will now import from the source database.

    ![Loading](/Images/12-loading.png)
1. Once the data has loaded successfully, click "Transform Data" to setup a custom filter for incremental refresh.

    ![Transform data](/Images/13-filter01.png)
1. Find the FactInternetSales table's OrderDate column and add a custom filter.

    ![Custom Filter](/Images/13-filter02.png)
1. Set the filter to be "is after or equal to" the parameter "RangeStart" and "is before" the parameter "RangeEnd" and click "OK".

    ![Filter Range](/Images/13-filter03.png)
1. Now that the range filter is applied, right click on "FactInternetSales" and select "Incremental Refresh".

    ![Incremental Refresh](/Images/14-incrementalrefresh1.png)
1. Setup an incremental refresh policy and click "Apply".

    ![Incremental Refresh Policy](/Images/14-incrementalrefresh2.png)
1. Click deploy, and deploy the configured report to the Power BI workspace.