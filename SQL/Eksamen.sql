create or replace package is309exam_pkg 
IS
procedure CREATE_PLEDGE_PP (
    p_campaignID          IN INTEGER     -- required
  , p_pledgeAmt           IN NUMBER      -- required
  , p_email               IN VARCHAR2    -- required
  , p_pledgeID           OUT INTEGER
  );
function CAMPAIGN_PLEDGES_PF (
    p_campaignID          IN INTEGER     -- required
  ) RETURN NUMBER;
END is309exam_pkg;
/
 -- package body
create or replace package body is309exam_pkg
is
procedure CREATE_PLEDGE_PP (
    p_campaignID          IN INTEGER     -- required
  , p_pledgeAmt           IN NUMBER      -- required
  , p_email               IN VARCHAR2    -- required
  , p_pledgeID            IN INTEGER
  ) IS
  lv_error_txt      VARCHAR2(150);
  ex_error          EXCEPTION;
  lv_count_num      INTEGER := 0 ;
  lv_createDate_date PT_PLEDGE.PLEDGE_CREATE_DATE%TYPE;
  lv_endDate_date    PT_PLEDGE.PLEDGE_END_DATE%TYPE;
  lv_pledgeID_num   INTEGER;
  lv_rewardLevel_num PT_REWARD.REWARD_PLEDGE_LEVEL%TYPE;
   
BEGIN
   
  -- Check that the p_campaignID, p_pledgeAmt, and p_email all have values
   
  IF p_campaignID IS NULL THEN
    lv_error_txt := 'The campaign id must not be null.';
    RAISE ex_error;
  ELSIF p_pledgeAmt IS NULL THEN
    lv_error_txt := 'The pledge amount must not be null.';
    RAISE ex_error;
  ELSIF p_email IS NULL THEN
    lv_error_txt := 'The patron email must not be null.';
    RAISE ex_error;
  END IF;
   
  -- Check that the p_campaignID, p_email references exist
   
  SELECT count(*) INTO lv_count_num
  FROM PT_REWARD
  WHERE campaign_id = p_campaignID 
    ;
     
  IF lv_count_num = 0 THEN
    lv_error_txt := 'Campaign ' || p_campaignID || ' does not exist.';
    RAISE ex_error;
  END IF;
   
  SELECT count(*) INTO lv_count_num
  FROM PT_INDIVIDUAL
  WHERE ind_email = p_email;
   
  IF lv_count_num = 0 THEN
    lv_error_txt := 'The patron with the email ' || p_email || ' was not found.';
    RAISE ex_error;
  END IF;
   
  -- Set create date to today's date and end date to NULL
   
  lv_createDate_date := CURRENT_DATE;
  lv_endDate_date := NULL;
   
   
  -- Check that the pledge amount is greater than zero.
   
  IF p_pledgeAmt <= 0 THEN
    lv_error_txt := 'The pledge amount must be greater than zero.';
    RAISE ex_error;
  END IF;
   
  -- Determine the highest reward level that is less than or equal to the pledge
   
 
 
  select max(reward_pledge_level)  INTO lv_rewardLevel_num
  from pt_reward
  where reward_pledge_level <= p_pledgeAmt
    and campaign_id = p_campaignID;
     
   IF lv_rewardLevel_num IS NULL THEN                          
      lv_error_txt := 'No reward for Campaign ' ;  
      RAISE ex_error;
   END IF;   
   
  -- Generate a new pledge identifier
   
  lv_pledgeID_num := pledge_sq.nextval;
   
   
  -- INSERT new pledge
  INSERT
    INTO PT_PLEDGE
  (
    PLEDGE_ID,
    PLEDGE_CREATE_DATE,
    PLEDGE_AMOUNT,
    PLEDGE_END_DATE,
    CAMPAIGN_ID,
    REWARD_PLEDGE_LEVEL,
    INDIVIDUAL_EMAIL
  )
  VALUES
  (
    lv_pledgeID_num,
    lv_createDate_date,
    p_pledgeAmt,
    lv_endDate_date,
    p_campaignID,
    lv_rewardLevel_num,
    p_email
  );
   
  COMMIT;
   
  PRINT('A pledge of ' || p_pledgeAmt || ' has been made to campaign ' || p_campaignID); --dbms outprint må til
   
  -- Return the new pledge id, if successful insert | Burde kanskje være en if
  p_pledgeID := lv_pledgeID_num;
   
 
  
   END CREATE_PLEDGE_PP;
   
function CAMPAIGN_PF (
    p_campaignID          IN INTEGER     -- required
  ) RETURN NUMBER
IS
  lv_error_txt      VARCHAR2(150);
  ex_error          INTEGER; -- må være exception
  lv_campaignName   PT_CAMPAIGN.CAMPAIGN_NAME%TYPE;
   
  cursor campaign_pledges_cur is --aldri åpnet og stengt CLOSE/OPEN cursor
      SELECT pledge_create_date
           , pledge_end_date
           , reward_pledge_level
           , pledge_amount
           , individual_email
      FROM PT_PLEDGE
      WHERE campaign_id = p_campaignID;
   campaign_pledges_rec  campaign_pledges_cur%CURSORTYPE;  --er ingen ting som heter cursor type, ha rowtype på datatypene
   
BEGIN
 
  IF p_campaignID IS NULL THEN
     lv_error_txt := 'A campaign ID must be provide.';
     RAISE ex_error;
  END IF;
   
  lv_error_txt := 'Campaign ' || p_campaignID || ' was not found.';
  SELECT CAMPAIGN_NAME INTO lv_campaignName
  FROM PT_CAMPAIGN
  WHERE CAMPAIGN_ID = p_campaignID;
   
  DBMS_OUTPUT.PUT_LINE('Pledges for ' || lv_campaignName || ':'); -- skal være inne i linje 173 inni loop
   
  lv_count_num := 0; --ikke deklarert
 
   
   
  LOOP
   
    FETCH campaign_pledges_cur INTO campaign_pledges_rec; -- cursortype kommer til ødelegge den
    EXIT WHEN campaign_pledges_cur%NOTFOUND;
     
    DBMS_OUTPUT.PUT_LINE('Pledge created: ' || campaign_pledges_rec.pledge_create_date);
    DBMS_OUTPUT.PUT_LINE('Pledge amount : ' || campaign_pledges_rec.pledge_amount);
    DBMS_OUTPUT.PUT_LINE('Reward level  : ' || campaign_pledges_rec.reward_pledge_level);
    DBMS_OUTPUT.PUT_LINE('Patron        : ' || campaign_pledges_rec.individual_email);
    DBMS_OUTPUT.PUT_LINE(' ');
   
  END LOOP;
   
  IF lv_count_num = 0 THEN -- vill altid være sann
    DBMS_OUTPUT.PUT_LINE('No pledges.');
  END IF;
   
  RETURN lv_count_num;
   
  EXCEPTION
  WHEN ex_error THEN
    DBMS_OUTPUT.PUT_LINE(lv_error_txt);
    
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LiNE(lv_error_txt);
    RETURN NULL;
 
END CAMPAIGN_PF;
END is309exam_pkg;
/