create or replace PACKAGE ioby3B_pkg
AS PROCEDURE CREATE_ACCOUNT_PP
  ( p_account_id    OUT I_ACCOUNT.ACCOUNT_ID%TYPE,
  p_email         IN  I_ACCOUNT.ACCOUNT_EMAIL%TYPE, -- must not be NULL
  p_password      IN  I_ACCOUNT.ACCOUNT_PASSWORD%TYPE, -- must not be NULL
  p_account_type  IN  I_ACCOUNT.ACCOUNT_TYPE%TYPE, -- should have value of 'Group or organization' or 'Individual'
  p_first_name    IN  I_ACCOUNT.ACCOUNT_FIRST_NAME%TYPE,
  p_last_name     IN  I_ACCOUNT.ACCOUNT_LAST_NAME%TYPE,
  p_location_name IN  I_ACCOUNT.ACCOUNT_LOCATION_NAME%TYPE -- must not be NULL
    );
 
  PROCEDURE CREATE_PROJECT_PP
    (p_project_id        OUT  I_PROJECT.project_id%TYPE,
p_title             IN  I_PROJECT.project_title%TYPE,
p_goal              IN  I_PROJECT.project_goal%TYPE,        -- The goal should be >= zero
p_deadline          IN  I_PROJECT.project_deadline%TYPE,
p_creation_date     IN  I_PROJECT.project_creation_date%TYPE,
p_description       IN  I_PROJECT.project_description%TYPE,
p_subtitle          IN  I_PROJECT.project_subtitle%TYPE,
p_street_1          IN  I_PROJECT.project_street_1%TYPE,
p_street_2          IN  I_PROJECT.project_street_2%TYPE,
p_city              IN  I_PROJECT.project_city%TYPE,
p_state             IN  I_PROJECT.project_state%TYPE,
p_postal_code       IN  I_PROJECT.project_postal_code%TYPE,
p_postal_extension  IN  I_PROJECT.project_postal_extension%TYPE,
p_steps_to_take     IN  I_PROJECT.project_steps_to_take%TYPE,
p_motivation        IN  I_PROJECT.project_motivation%TYPE,
p_volunteer_need    IN  I_PROJECT.project_volunteer_need%TYPE,  -- should be 'yes' or 'no'
p_project_status    IN  I_PROJECT.project_status%TYPE,  -- should be in {'Closed', 'Completed','Open', 'Submitted', 'Underway'}
p_account_id        IN  I_PROJECT.account_id%TYPE  -- should match account in the account table
    );

  PROCEDURE CREATE_GIVING_LEVEL_PP
    (p_projectID         IN I_GIVING_LEVEL.PROJECT_ID%TYPE,
  p_givingLevelAmt    IN I_GIVING_LEVEL.GIVING_LEVEL_AMOUNT%TYPE, -- Must be > zero or NULL
  p_givingDescription IN I_GIVING_LEVEL.GIVING_LEVEL_DESCRIPTION%TYPE -- Must not be NULL
    );


  PROCEDURE ADD_BUDGET_ITEM_PP
    (
   p_projectID      IN I_BUDGET.PROJECT_ID%TYPE,
  p_description    IN I_BUDGET.BUDGET_LINE_ITEM_DESCRIPTION%TYPE,
  p_budgetAmt      IN I_BUDGET.BUDGET_LINE_ITEM_AMOUNT%TYPE
    );

  PROCEDURE ADD_WEBSITE_PP
    (p_accountEmail          IN VARCHAR,
p_websiteOrder          IN INTEGER,  -- Must be >= zero or NULL
p_websiteTitle          IN VARCHAR,
p_websiteURL            IN VARCHAR);

  PROCEDURE ADD_FOCUSAREA_PP
    (
    p_focusArea  IN I_FOCUS_AREA.FOCUS_AREA_NAME%TYPE,
  p_project_ID IN I_PROJECT.PROJECT_ID%TYPE
    );

  PROCEDURE ADD_PROJTYPE_PP
    (
   p_projType              IN I_PROJ_PROJTYPE.PROJECT_TYPE_NAME%TYPE,
  p_project_ID            IN I_PROJECT.PROJECT_ID%TYPE
    );

  PROCEDURE CREATE_ACCOUNT_PP
    (
    p_account_id       OUT I_ACCOUNT.ACCOUNT_ID%TYPE,
  p_email            IN  I_ACCOUNT.ACCOUNT_EMAIL%TYPE, -- must not be NULL
  p_password         IN  I_ACCOUNT.ACCOUNT_PASSWORD%TYPE, -- must not be NULL
  p_account_type     IN  I_ACCOUNT.ACCOUNT_TYPE%TYPE, -- should have value of 'Group or organization' or 'Individual'
  p_first_name       IN  I_ACCOUNT.ACCOUNT_FIRST_NAME%TYPE,
  p_last_name        IN  I_ACCOUNT.ACCOUNT_LAST_NAME%TYPE,
  p_location_name    IN  I_ACCOUNT.ACCOUNT_LOCATION_NAME%TYPE, -- must not be NULL
  p_street           IN  I_ACCOUNT.ACCOUNT_STREET%TYPE, -- must not be NULL
  p_additional       IN  I_ACCOUNT.ACCOUNT_ADDITIONAL%TYPE,
  p_city             IN  I_ACCOUNT.ACCOUNT_CITY%TYPE, -- must not be NULL
  p_stateprovince    IN  I_ACCOUNT.ACCOUNT_STATE_PROVINCE%TYPE,
  p_postalCode       IN  I_ACCOUNT.ACCOUNT_POSTAL_CODE%TYPE, -- nust not be NULL
  p_heardAbout       IN  I_ACCOUNT.ACCOUNT_HEARD_ABOUT%TYPE, -- nust not be NULL
  p_heardAboutdetail IN  I_ACCOUNT.ACCOUNT_HEARD_ABOUT_DETAIL%TYPE
    );

  PROCEDURE ADD_DONATION_PP
    (p_projectID       IN INTEGER,
  p_accountEmail    IN VARCHAR,
  p_amount          IN NUMBER     -- must not be NULL; must be > 0
    );


  PROCEDURE UPDATE_DONATION_PP
    (p_projectID       IN I_GIVING_LEVEL.PROJECT_ID%TYPE,
p_accountEmail    IN VARCHAR,
p_amount          IN NUMBER     -- must not be NULL; must be > 0
    );

  PROCEDURE VIEW_CART_PP
    (p_accountEmail IN I_ACCOUNT.ACCOUNT_EMAIL%TYPE);

  PROCEDURE CHECKOUT_PP(
  p_accountEmail     IN  VARCHAR, -- Must not be NULL
  p_date             IN  DATE, -- If NULL, use CURRENT_DATE
  p_anonymous        IN  VARCHAR, -- default value is 'yes'.
  p_displayName      IN  VARCHAR,
  p_giveEmail        IN  VARCHAR, -- default value is 'no'
  p_billingFirstName IN  VARCHAR,
  p_billingLastName  IN  VARCHAR, -- must not be NULL
  p_billingAddress   IN  VARCHAR, -- must not be NULL
  p_billingState     IN  VARCHAR, -- must not be NULL
  p_zipcode          IN  VARCHAR, -- must not be NULL
  p_country          IN  VARCHAR, -- must not be NULL
  p_creditCard       IN  VARCHAR, -- must not be NULL
  p_expMonth         IN  NUMBER, -- must not be NULL
  p_expYear          IN  NUMBER, -- must be > 2015
  p_secCode          IN  NUMBER, -- must not be NULL
  p_orderNumber      OUT NUMBER);


  FUNCTION CALC_PERCENT_OF_GOAL_PF
    (p_projectID IN INTEGER)
    RETURN NUMBER;


 PROCEDURE STATUS_UNDERWAY_PP;
END ioby3b_pkg;