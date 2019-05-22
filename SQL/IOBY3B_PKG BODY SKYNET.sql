create or replace PACKAGE BODY ioby3b_pkg IS

    PROCEDURE create_account_pp (
        p_account_id      OUT i_account.account_id%TYPE,
        p_email           IN i_account.account_email%TYPE, -- must not be NULL
        p_password        IN i_account.account_password%TYPE, -- must not be NULL
        p_account_type    IN i_account.account_type%TYPE, -- should have value of 'Group or organization' or 'Individual'
        p_first_name      IN i_account.account_first_name%TYPE,
        p_last_name       IN i_account.account_last_name%TYPE,
        p_location_name   IN i_account.account_location_name%TYPE -- must not be NULL
    ) IS

        ex_error EXCEPTION;
        errmsg_txt        VARCHAR(100) := NULL;
        ex_notchecked EXCEPTION;
        wrong_email EXCEPTION;
        account_typo EXCEPTION;
        PRAGMA exception_init ( wrong_email,-1 );
        PRAGMA exception_init ( account_typo,-1400 );
        lv_account_type   i_account.account_type%TYPE;
        lv_id_out         NUMBER;
    BEGIN
        lv_id_out := lv_id_out_sq.nextval;
        IF
            p_email IS NULL
        THEN
            errmsg_txt := 'Illegal input, e-mail should not be null';
            RAISE ex_error;
        ELSIF p_password IS NULL THEN
            errmsg_txt := 'Illegal input, password should not be null';
            RAISE ex_error;
        ELSIF p_location_name IS NULL THEN
            errmsg_txt := 'Illegal input, location name should not be null';
            RAISE ex_error;
        END IF;

        IF
            upper(p_account_type) = 'INDIVIDUAL'
        THEN
            lv_account_type := 'Individual';
        ELSIF lower(p_account_type) = 'individual' THEN
            lv_account_type := 'Individual';
        ELSIF upper(p_account_type) = 'GROUP OR ORGANIZATION' THEN
            lv_account_type := 'Group or Organization';
        ELSIF lower(p_account_type) = 'group or organization' THEN
            lv_account_type := 'Group or Organization';
        END IF;

        INSERT INTO i_account (
            account_id,
            account_email,
            account_password,
            account_type,
            account_first_name,
            account_last_name,
            account_location_name
        ) VALUES (
            lv_id_out,
            p_email,
            p_password,
            lv_account_type,
            p_first_name,
            p_last_name,
            p_location_name
        );

        COMMIT;
    EXCEPTION
        WHEN ex_error THEN
            dbms_output.put_line(errmsg_txt);
            ROLLBACK;
        WHEN ex_notchecked THEN
            dbms_output.put_line('the account_type: "'|| p_account_type|| ' ",is not valid');
            ROLLBACK;
        WHEN wrong_email THEN
            dbms_output.put_line('E-Mail: '|| p_email|| ' -- already exist');
            ROLLBACK;
        WHEN account_typo THEN
            dbms_output.put_line('Account Type: "'|| p_account_type
            || '" is not correct, choose between: Individual / Group or Organization');
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END create_account_pp;

    PROCEDURE create_project_pp (
        p_project_id         OUT i_project.project_id%TYPE,
        p_title              IN i_project.project_title%TYPE,
        p_goal               IN i_project.project_goal%TYPE,        -- The goal should be >= zero
        p_deadline           IN i_project.project_deadline%TYPE,
        p_creation_date      IN i_project.project_creation_date%TYPE,
        p_description        IN i_project.project_description%TYPE,
        p_subtitle           IN i_project.project_subtitle%TYPE,
        p_street_1           IN i_project.project_street_1%TYPE,
        p_street_2           IN i_project.project_street_2%TYPE,
        p_city               IN i_project.project_city%TYPE,
        p_state              IN i_project.project_state%TYPE,
        p_postal_code        IN i_project.project_postal_code%TYPE,
        p_postal_extension   IN i_project.project_postal_extension%TYPE,
        p_steps_to_take      IN i_project.project_steps_to_take%TYPE,
        p_motivation         IN i_project.project_motivation%TYPE,
        p_volunteer_need     IN i_project.project_volunteer_need%TYPE,  -- should be 'yes' or 'no'
        p_project_status     IN i_project.project_status%TYPE,  -- should be in {'Closed', 'Completed','Open', 'Submitted', 'Underway'}
        p_account_id         IN i_project.account_id%TYPE  -- should match account in the account table
    ) IS

        error_txt         VARCHAR(200) := NULL;
        lv_status         i_project.project_status%TYPE := 'Submitted';
        lv_date           i_project.project_creation_date%TYPE;
        lv_current_date   i_project.project_creation_date%TYPE;
        counter           NUMBER;
        current_date_error EXCEPTION;
        goal_error EXCEPTION;
        setting_date_error EXCEPTION;
        empty_a_id EXCEPTION;
        too_small EXCEPTION;
        no_volunteer EXCEPTION;
        no_data_found EXCEPTION;
        lv_sequence       NUMBER;
    BEGIN
        lv_sequence := account_sq.nextval;
        IF
            p_project_status IS NULL
        THEN
            error_txt := 'You need to fill inn all attributes';
            RAISE no_data_found;
        ELSIF p_goal IS NULL THEN
            error_txt := 'You need to fill inn all attributes';
            RAISE no_data_found;
            IF
                p_deadline IS NULL
            THEN
                error_txt := 'You need to fill inn all attributes';
                RAISE no_data_found;
            ELSIF p_description IS NULL THEN
                error_txt := 'You need to fill inn all attributes';
                RAISE no_data_found;
            ELSIF p_city IS NULL THEN
                error_txt := 'You need to fill inn all attributes';
                RAISE no_data_found;
            ELSIF p_state IS NULL THEN
                error_txt := 'You need to fill inn all attributes';
                RAISE no_data_found;
            ELSIF p_state IS NULL THEN
                error_txt := 'You need to fill inn all attributes';
                RAISE no_data_found;
            ELSIF p_postal_code IS NULL THEN
                error_txt := 'You need to fill inn all attributes';
                RAISE no_data_found;
            ELSIF p_goal <= 0 THEN
                error_txt := 'Goal needs to be above 0';
                RAISE too_small;
            END IF;

            SELECT
                COUNT(*)
            INTO
                counter
            FROM
                i_account
            WHERE
                i_account.account_id = p_account_id;

            IF
                counter > 0
            THEN
                INSERT INTO i_project VALUES (
                    lv_sequence,
                    p_title,
                    p_goal,
                    p_deadline,
                    lv_current_date,
                    p_description,
                    p_subtitle,
                    p_street_1,
                    p_street_2,
                    p_city,
                    p_state,
                    p_postal_code,
                    p_postal_extension,
                    p_steps_to_take,
                    p_motivation,
                    p_volunteer_need,
                    p_project_status,
                    p_account_id
                );

            ELSIF counter = 0 THEN
                error_txt := 'You need an account ID';
                RAISE empty_a_id;
            END IF;

        END IF;

        IF
            p_creation_date IS NULL
        THEN
            lv_current_date := SYSDATE;
        ELSIF p_creation_date IS NOT NULL THEN
            lv_current_date := p_creation_date;
        END IF;

        IF
            p_project_status != 'Closed'
        THEN
            lv_status := p_project_status;
        ELSIF p_project_status != 'Completed'-- OR 'Completed' OR 'Open' OR 'Submitted' OR 'Underway'
         THEN
            lv_status := p_project_status;
        ELSIF p_project_status != 'Open' THEN
            lv_status := p_project_status;
        ELSIF p_project_status != 'Submitted' THEN
            lv_status := p_project_status;
        ELSIF p_project_status != 'Underway' THEN
            lv_status := p_project_status;
        ELSIF p_volunteer_need != 'yes' -- OR 'no'
         THEN
            error_txt := 'You need to fill in yes or no for volunteer need';
            RAISE no_volunteer;
        ELSIF p_volunteer_need != 'no' THEN
            error_txt := 'You need to fill in yes or no for volunteer need';
            RAISE no_volunteer;
        END IF;

        IF
            p_goal <= 0
        THEN
            error_txt := 'The goal must be set greater than 0.';
            RAISE goal_error;
        END IF;
        IF
            p_creation_date > p_deadline
        THEN
            error_txt := 'Deadline must be set later than the creation date.';
            RAISE setting_date_error;
        END IF;
        INSERT INTO i_project VALUES (
            lv_sequence,
            p_title,
            p_goal,
            p_deadline,
            lv_current_date,
            p_description,
            p_subtitle,
            p_street_1,
            p_street_2,
            p_city,
            p_state,
            p_postal_code,
            p_postal_extension,
            p_steps_to_take,
            p_motivation,
            p_volunteer_need,
            p_project_status,
            p_account_id
        );

        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN current_date_error THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN too_small THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN goal_error THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN setting_date_error THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_volunteer THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN empty_a_id THEN
            dbms_output.put_line(error_txt);
	--RETURN NULL;
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END create_project_pp;

    PROCEDURE create_giving_level_pp (
        p_projectid           IN i_giving_level.project_id%TYPE,
        p_givinglevelamt      IN i_giving_level.giving_level_amount%TYPE, -- Must be > zero or NULL
        p_givingdescription   IN i_giving_level.giving_level_description%TYPE -- Must not be NULL
    ) IS

        lv_p_givinglevelamt      i_giving_level.giving_level_amount%TYPE;
        lv_p_projectid           i_giving_level.project_id%TYPE;
        lv_p_givingdescription   i_giving_level.giving_level_description%TYPE;
        no_data_found EXCEPTION;
        too_small EXCEPTION;
        error_txt                VARCHAR(200) := NULL;
        no_project EXCEPTION;
        PRAGMA exception_init ( no_project,-2291 );
        counter                  NUMBER;
    BEGIN
        IF
            p_projectid IS NULL
        THEN
            error_txt := 'This project does not exist';
            RAISE no_data_found;
        ELSIF p_givinglevelamt IS NULL THEN
            error_txt := 'Amount needs a number';
            RAISE no_data_found;
        ELSIF p_givinglevelamt <= 0 THEN
            error_txt := 'Amount has to be above zero';
            RAISE too_small;
        ELSIF p_givingdescription IS NULL THEN
            error_txt := 'You need to input a description';
            RAISE no_data_found;
        END IF;

        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_giving_level
        WHERE
            project_id = p_projectid
            AND   giving_level_amount = p_givinglevelamt;

        IF
            counter > 0
        THEN
            UPDATE i_giving_level
                SET
                    i_giving_level.giving_level_description = p_givingdescription
            WHERE
                project_id = p_projectid
                AND   giving_level_amount = p_givinglevelamt;

        ELSE
            IF
                counter = 0
            THEN
                INSERT INTO i_giving_level VALUES (
                    p_projectid,
                    p_givinglevelamt,
                    p_givingdescription
                );

            END IF;
        END IF;

        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN too_small THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_project THEN
            dbms_output.put_line('Project ID: '|| p_projectid|| ' -- does not exist');
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END create_giving_level_pp;

    PROCEDURE add_budget_item_pp (
        p_projectid     IN i_budget.project_id%TYPE,
        p_description   IN i_budget.budget_line_item_description%TYPE,
        p_budgetamt     IN i_budget.budget_line_item_amount%TYPE
    ) IS

        no_data_found EXCEPTION;
        too_small EXCEPTION;
        no_project EXCEPTION;
        project_is_null EXCEPTION;
        already_exist EXCEPTION;
        error_txt   VARCHAR(200) := NULL;
        counter     NUMBER;
        PRAGMA exception_init ( no_project,-2291 );
    BEGIN
        IF
            p_projectid IS NULL
        THEN
            error_txt := 'Project ID cannot be NULL';
            RAISE project_is_null;
        ELSIF p_description IS NULL THEN
            error_txt := 'Please add a description';
            RAISE no_data_found;
        ELSIF p_budgetamt <= 0 THEN
            error_txt := 'Please insert a value higher than 0';
            RAISE too_small;
        END IF;

        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_budget
        WHERE
            project_id = p_projectid
            AND   budget_line_item_description = p_description;

        IF
            counter > 0
        THEN
            error_txt := 'There is already an item in this project with this description';
            RAISE already_exist;
        ELSE
            IF
                counter = 0
            THEN
                INSERT INTO i_budget VALUES (
                    p_projectid,
                    p_description,
                    p_budgetamt
                );

            END IF;
        END IF;

        COMMIT;
    EXCEPTION
        WHEN project_is_null THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_data_found THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN too_small THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN already_exist THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_project THEN
            dbms_output.put_line('Project ID '|| p_projectid|| ' does not exist');
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END add_budget_item_pp;

    PROCEDURE add_website_pp (
        p_accountemail   IN VARCHAR,
        p_websiteorder   IN INTEGER,  -- Must be >= zero or NULL
        p_websitetitle   IN VARCHAR,
        p_websiteurl     IN VARCHAR
    ) IS

        ex_error EXCEPTION;
        ex_ordernull EXCEPTION;
        ex_ordertoobig EXCEPTION;
        counter           NUMBER;
        var_acc           i_account.account_id%TYPE := NULL;
        var_order         i_website.website_order%TYPE := NULL;
        var_rowholder     i_website%rowtype := NULL;
        var_orderholder   i_website.website_order%TYPE := NULL;
        errmsg_txt        VARCHAR(100) := NULL;
    BEGIN
        SELECT
            account_id
        INTO
            var_acc
        FROM
            i_account
        WHERE
            account_email = p_accountemail;

        dbms_output.put_line('Procedure started!');
        IF
            p_accountemail IS NULL
        THEN
            errmsg_txt := 'The input parameter of EMAIL is NULL.';
            RAISE ex_error;
        ELSIF p_websiteurl IS NULL THEN
            errmsg_txt := 'The input parameter website URL is NULL';
            RAISE ex_error;
        ELSIF p_websitetitle IS NULL THEN
            errmsg_txt := 'The input parameter Website Title is NULL';
            RAISE ex_error;
        ELSIF p_websiteorder <= 0 THEN
            errmsg_txt := 'The input parameter WebSiteOrder needs to be greater than 0!';
            RAISE ex_error;
        ELSIF p_websiteorder IS NULL THEN
            dbms_output.put_line('Value is NULL, exception handler accordingly');
            RAISE ex_ordernull;
        ELSIF p_websiteorder > 0 THEN
            dbms_output.put_line('Value is greater than 0, exception handler accordingly');
            RAISE ex_ordertoobig;
        END IF;

        SELECT
            website_order
        INTO
            var_order
        FROM
            (
                SELECT
                    *
                FROM
                    i_website
                ORDER BY
                    website_order DESC
            ) i_website
        WHERE
            account_id = var_acc
            AND   ROWNUM = 1
        ORDER BY
            ROWNUM;

        var_order := var_order + 1;
        INSERT INTO i_website (
            account_id,
            website_order,
            website_title,
            website_url
        ) VALUES (
            var_acc,
            var_order,
            p_websitetitle,
            p_websiteurl
        );

        COMMIT;

        SELECT
            website_order
        INTO
            var_order
        FROM
            (
                SELECT
                    *
                FROM
                    i_website
                ORDER BY
                    website_order DESC
            ) i_website
        WHERE
            account_id = var_acc
            AND   i_website.website_order = p_websiteorder
            AND   ROWNUM = 1
        ORDER BY
            ROWNUM;

        INSERT INTO i_website (
            account_id,
            website_order,
            website_title,
            website_url
        ) VALUES (
            var_acc,
            p_websiteorder,
            p_websitetitle,
            p_websiteurl
        );

        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No result on this email address.');
        WHEN ex_error THEN
            dbms_output.put_line(errmsg_txt);
        WHEN ex_ordernull THEN
            dbms_output.put_line('NULL expception started');
            SELECT
                website_order
            INTO
                var_order
            FROM
                (
                    SELECT
                        *
                    FROM
                        i_website
                    ORDER BY
                        website_order DESC
                ) i_website
            WHERE
                account_id = var_acc
                AND   ROWNUM = 1
            ORDER BY
                ROWNUM;

            var_order := var_order + 1;
            INSERT INTO i_website (
                account_id,
                website_order,
                website_title,
                website_url
            ) VALUES (
                var_acc,
                var_order,
                p_websitetitle,
                p_websiteurl
            );

            COMMIT;
        WHEN ex_ordertoobig THEN
            dbms_output.put_line('It is too large!');
            SELECT
                COUNT(*)
            INTO
                counter
            FROM
                i_website
            WHERE
                account_id = var_acc
                AND   i_website.website_order >= p_websiteorder;

            dbms_output.put_line(counter);
            
            var_order := p_websiteorder + 1;
            var_orderholder := p_websiteorder;
            WHILE counter > 0 LOOP
                dbms_output.put_line('LOOPING');
      
                UPDATE i_website
                    SET
                        website_order = var_order
                WHERE
                    account_id = var_acc
                    AND   i_website.website_order >= var_orderholder;

                var_order := p_websiteorder + 1;

                counter := counter - 1;
                COMMIT;
            END LOOP;

            IF
                counter = 0
            THEN
                dbms_output.put_line('ALL DONE!');
                INSERT INTO i_website (
                    account_id,
                    website_order,
                    website_title,
                    website_url
                ) VALUES (
                    var_acc,
                    p_websiteorder,
                    p_websitetitle,
                    p_websiteurl
                );

                COMMIT;
            END IF;

        WHEN OTHERS THEN
            dbms_output.put_line('The error code is: '|| sqlcode);
            dbms_output.put_line('The error msg is:  '|| sqlerrm);
            ROLLBACK;
    END add_website_pp;

    PROCEDURE add_focusarea_pp (
        p_focusarea    IN i_focus_area.focus_area_name%TYPE,
        p_project_id   IN i_project.project_id%TYPE
    ) IS

        ex_error EXCEPTION;
        ex_not_exist EXCEPTION;
        errmsg_txt   VARCHAR(100) := NULL;
        counter      NUMBER;
        counter2     NUMBER;
    BEGIN
        IF
            p_project_id IS NULL
        THEN
            errmsg_txt := 'project_id can not be null';
            RAISE ex_error;
        ELSIF p_focusarea IS NULL THEN
            errmsg_txt := 'focus_area can not be null';
            RAISE ex_error;
        END IF;

        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_focus_area
        WHERE
            p_focusarea = i_focus_area.focus_area_name;

        IF
            counter = 0
        THEN
            errmsg_txt := 'focus_area does not exist';
            RAISE ex_not_exist;
        END IF;
        SELECT
            COUNT(*)
        INTO
            counter2
        FROM
            i_project
        WHERE
            p_project_id = i_project.project_id;

        IF
            counter2 = 0
        THEN
            errmsg_txt := 'project does not exist';
            RAISE ex_not_exist;
        END IF;
        INSERT INTO i_proj_focusarea VALUES (
            p_focusarea,
            p_project_id
        );

        COMMIT;
    EXCEPTION
        WHEN ex_error THEN
            dbms_output.put_line(errmsg_txt);
            ROLLBACK;
        WHEN ex_not_exist THEN
            dbms_output.put_line(errmsg_txt);
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('The error code is: '|| sqlcode);
            dbms_output.put_line('The error msg is:  '|| sqlerrm);
            ROLLBACK;
    END add_focusarea_pp;

    PROCEDURE add_projtype_pp (
        p_projtype     IN i_proj_projtype.project_type_name%TYPE,
        p_project_id   IN i_project.project_id%TYPE
    ) IS

        ex_no_id EXCEPTION;
        ex_no_type EXCEPTION;
        ex_not_allowed EXCEPTION;
        counter     NUMBER;
        counter2    NUMBER;
        error_txt   VARCHAR(250) := NULL;
    BEGIN
        IF
            p_projtype IS NULL
        THEN
            error_txt := 'Project type cannot be NULL';
            RAISE ex_no_type;
        ELSIF p_project_id IS NULL THEN
            error_txt := 'Project ID cannot be NUll';
            RAISE ex_no_id;
        END IF;

        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_proj_projtype
        WHERE
            p_projtype = i_proj_projtype.project_type_name
            AND   ROWNUM = 1;

        IF
            counter = 0
        THEN
            error_txt := 'The project type name does not exist.';
            RAISE ex_not_allowed;
        ELSE
            dbms_output.put_line('Project type name exists.');
        END IF;

        SELECT
            COUNT(*)
        INTO
            counter2
        FROM
            i_project
        WHERE
            p_project_id = i_project.project_id
            AND   ROWNUM = 1;

        IF
            counter2 = 0
        THEN
            error_txt := 'The project ID does not exist.';
            RAISE ex_not_allowed;
        ELSE
            dbms_output.put_line('Project ID exists.');
        END IF;

        INSERT INTO i_proj_projtype VALUES (
            p_projtype,
            p_project_id
        );

        COMMIT;
    EXCEPTION
        WHEN ex_no_type THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN ex_no_id THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN ex_not_allowed THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
    END add_projtype_pp;

    PROCEDURE create_account_pp (
        p_account_id         OUT i_account.account_id%TYPE,
        p_email              IN i_account.account_email%TYPE, -- must not be NULL
        p_password           IN i_account.account_password%TYPE, -- must not be NULL
        p_account_type       IN i_account.account_type%TYPE, -- should have value of 'Group or organization' or 'Individual'
        p_first_name         IN i_account.account_first_name%TYPE,
        p_last_name          IN i_account.account_last_name%TYPE,
        p_location_name      IN i_account.account_location_name%TYPE, -- must not be NULL
        p_street             IN i_account.account_street%TYPE, -- must not be NULL
        p_additional         IN i_account.account_additional%TYPE,
        p_city               IN i_account.account_city%TYPE, -- must not be NULL
        p_stateprovince      IN i_account.account_state_province%TYPE,
        p_postalcode         IN i_account.account_postal_code%TYPE, -- nust not be NULL
        p_heardabout         IN i_account.account_heard_about%TYPE, -- nust not be NULL
        p_heardaboutdetail   IN i_account.account_heard_about_detail%TYPE
    ) IS

        ex_error EXCEPTION;
        errmsg_txt        VARCHAR(100) := NULL;
        ex_notchecked EXCEPTION;
        wrong_email EXCEPTION;
        account_typo EXCEPTION;
        PRAGMA exception_init ( account_typo,-1400 );
        lv_account_type   i_account.account_type%TYPE;
        lv_id_out2        NUMBER;
        counter           NUMBER;
    BEGIN
        lv_id_out2 := lv_id_out_sq5.nextval;

        IF
            p_street IS NULL
        THEN
            errmsg_txt := 'Illegal input, street should not be null';
            RAISE ex_error;
        ELSIF p_city IS NULL THEN
            errmsg_txt := 'Illegal input, city should not be null';
            RAISE ex_error;
        ELSIF p_postalcode IS NULL THEN
            errmsg_txt := 'Illegal input, postal code should not be null';
            RAISE ex_error;
        ELSIF p_heardabout IS NULL THEN
            errmsg_txt := 'Illegal input, heard about should not be null';
            RAISE ex_error;
        END IF;

        IF
            upper(p_account_type) = 'INDIVIDUAL'
        THEN
            lv_account_type := 'Individual';
        ELSIF lower(p_account_type) = 'individual' THEN
            lv_account_type := 'Individual';
        ELSIF upper(p_account_type) = 'GROUP OR ORGANIZATION' THEN
            lv_account_type := 'Group or Organization';
        ELSIF lower(p_account_type) = 'group or organization' THEN
            lv_account_type := 'Group or Organization';
        END IF;

        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_account
        WHERE
            account_email = p_email;

        IF
            counter > 0
        THEN
            UPDATE i_account
                SET
                    i_account.account_password = p_password,
                    i_account.account_type = p_account_type,
                    i_account.account_first_name = p_first_name,
                    i_account.account_last_name = p_last_name,
                    i_account.account_location_name = p_location_name,
                    i_account.account_street = p_street,
                    i_account.account_additional = p_additional,
                    i_account.account_city = p_city,
                    i_account.account_state_province = p_stateprovince,
                    i_account.account_postal_code = p_postalcode,
                    i_account.account_heard_about = p_heardabout,
                    i_account.account_heard_about_detail = p_heardaboutdetail
            WHERE
                account_email = p_email;

        ELSE
            IF
                counter = 0
            THEN
                INSERT INTO i_account (
                    account_id,
                    account_email,
                    account_password,
                    account_type,
                    account_first_name,
                    account_last_name,
                    account_location_name,
                    account_street,
                    account_additional,
                    account_city,
                    account_state_province,
                    account_postal_code,
                    account_heard_about,
                    account_heard_about_detail
                ) VALUES (
                    lv_id_out2,
                    p_email,
                    p_password,
                    lv_account_type,
                    p_first_name,
                    p_last_name,
                    p_location_name,
                    p_street,
                    p_additional,
                    p_city,
                    p_stateprovince,
                    p_postalcode,
                    p_heardabout,
                    p_heardaboutdetail
                );

            END IF;
        END IF;


     --- SP2 ---

        IF
            p_email IS NULL
        THEN
            errmsg_txt := 'Illegal input, e-mail should not be null';
            RAISE ex_error;
        ELSIF p_password IS NULL THEN
            errmsg_txt := 'Illegal input, password should not be null';
            RAISE ex_error;
        ELSIF p_location_name IS NULL THEN
            errmsg_txt := 'Illegal input, location name should not be null';
            RAISE ex_error;
        END IF;

        COMMIT;
    EXCEPTION
        WHEN ex_error THEN
            dbms_output.put_line(errmsg_txt);
            ROLLBACK;
        WHEN ex_notchecked THEN
            dbms_output.put_line('the account_type: "'|| p_account_type|| ' ",is not valid');
            ROLLBACK;
        WHEN account_typo THEN
            dbms_output.put_line('Account Type: "'|| p_account_type
            || '" is not correct, choose between: Individual / Group or Organization');
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END create_account_pp;

    PROCEDURE add_donation_pp (
        p_projectid      IN INTEGER,
        p_accountemail   IN VARCHAR,
        p_amount         IN NUMBER     -- must not be NULL; must be > 0
    ) IS

        error_txt      VARCHAR(200) := NULL;
        too_small EXCEPTION;
        lv_accountid   i_account.account_id%TYPE;
        counter        NUMBER;
        no_project EXCEPTION;
        duplicated_error EXCEPTION;
        PRAGMA exception_init ( no_project,-2291 );
        no_email EXCEPTION;
    BEGIN
        IF
            p_projectid IS NULL
        THEN
            error_txt := 'You need to input project id';
            RAISE no_data_found;
        END IF;
        IF
            p_accountemail IS NULL
        THEN
            error_txt := 'You need to input email';
            RAISE no_data_found;
        END IF;
        IF
            p_amount <= 0
        THEN
            error_txt := 'Amount has to be above zero';
            RAISE too_small;
        END IF;
        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_cart,
            i_project
        WHERE
            p_projectid = i_project.project_id;

        IF
            counter < 1
        THEN
            RAISE no_project;
        END IF;
        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_cart,
            i_account
        WHERE
            p_accountemail = i_account.account_email;

        IF
            counter < 1
        THEN
            RAISE no_email;
        END IF;
        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_cart,
            i_account
        WHERE
            p_accountemail = i_account.account_email
            AND   p_projectid = i_cart.project_id;

        IF
            counter > 0
        THEN
            RAISE duplicated_error;
        END IF;
        SELECT
            i_account.account_id
        INTO
            lv_accountid
        FROM
            i_account
        WHERE
            i_account.account_email = p_accountemail;

        INSERT INTO i_cart (
            project_id,
            account_id,
            amount
        ) VALUES (
            p_projectid,
            lv_accountid,
            p_amount
        );

        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN too_small THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_project THEN
            dbms_output.put_line('Project ID: '|| p_projectid|| ' -- does not exist');
            ROLLBACK;
        WHEN no_email THEN
            dbms_output.put_line('Email: '|| p_accountemail|| ' -- does not exist');
            ROLLBACK;
        WHEN duplicated_error THEN
            dbms_output.put_line(p_accountemail || ' already has donated to project with ID: '
            || p_projectid || ' ,donation not accepted');
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END add_donation_pp;

    PROCEDURE update_donation_pp (
        p_projectid      IN i_giving_level.project_id%TYPE,
        p_accountemail   IN VARCHAR,
        p_amount         IN NUMBER     -- must not be NULL; must be > 0
    ) IS

        no_data_found EXCEPTION;
        too_small EXCEPTION;
        error_txt      VARCHAR(200) := NULL;
        no_project EXCEPTION;
        PRAGMA exception_init ( no_project,-2291 );
        counter        NUMBER;
        lv_accountid   i_account.account_id%TYPE;
        no_donation EXCEPTION;
    BEGIN
        IF
            p_projectid IS NULL
        THEN
            error_txt := 'You need to input project id';
            RAISE no_data_found;
        END IF;
        IF
            p_accountemail IS NULL
        THEN
            error_txt := 'You need to input email';
            RAISE no_data_found;
        END IF;
        IF
            p_amount <= 0
        THEN
            error_txt := 'Amount has to be above zero';
            RAISE too_small;
        END IF;
        SELECT
            i_account.account_id
        INTO
            lv_accountid
        FROM
            i_account
        WHERE
            i_account.account_email = p_accountemail;

        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            i_cart
        WHERE
            i_cart.project_id = p_projectid
            AND   i_cart.account_id = lv_accountid;

        IF
            counter > 0
        THEN
            UPDATE i_cart
                SET
                    i_cart.amount = p_amount
            WHERE
                i_cart.project_id = p_projectid
                AND   i_cart.account_id = lv_accountid;

        ELSE
            RAISE no_donation;
        END IF;

        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_donation THEN
            dbms_output.put_line('This project has not been donated to and you can not update it');
            ROLLBACK;
        WHEN too_small THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN no_project THEN
            dbms_output.put_line('Project ID: '|| p_projectid || ' -- does not exist');
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '|| sqlcode);
            dbms_output.put_line('Error MSGE: '|| sqlerrm);
            ROLLBACK;
    END update_donation_pp;

    PROCEDURE view_cart_pp (
        p_accountemail   IN i_account.account_email%TYPE
    ) IS

        TYPE cart_rec IS RECORD ( project_id   i_cart.project_id%TYPE,
        account_id   i_cart.account_id%TYPE,
        amount       i_cart.amount%TYPE );
        
        TYPE cart_tab IS TABLE OF cart_rec INDEX BY PLS_INTEGER;
        lv_total     NUMBER;
        error_txt    VARCHAR(200) := NULL;
        no_data_found EXCEPTION;
        tabb         cart_tab;
        rec          cart_rec;
    BEGIN
        IF
            p_accountemail IS NULL
        THEN
            error_txt := 'You need to input email';
            RAISE no_data_found;
        END IF;
        SELECT
            i_cart.project_id,
            i_cart.account_id,
            i_cart.amount
        BULK COLLECT INTO
            tabb
        FROM
            i_cart,
            i_account
        WHERE
            i_cart.account_id = i_account.account_id
            AND   i_account.account_email = p_accountemail;

        dbms_output.put_line('Donations in the cart for: '
        || p_accountemail);
        FOR i IN tabb.first..tabb.last LOOP
            dbms_output.put_line('Project ID: '
            || (tabb(i).project_id)
            || ' Account ID: '
            || (tabb(i).account_id)
            || ' Amount: '
            || (tabb(i).amount) );
        END LOOP;

        SELECT
            SUM(i_cart.amount)
        INTO
            lv_total
        FROM
            i_cart,
            i_account
        WHERE
            i_cart.account_id = i_account.account_id
            AND   i_account.account_email = p_accountemail;

        dbms_output.put_line('The total sum are: '
        || lv_total);
        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line(error_txt);
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('Error CODE: '
            || sqlcode);
            dbms_output.put_line('Error MSGE: '
            || sqlerrm);
            ROLLBACK;
    END view_cart_pp;

    PROCEDURE checkout_pp (
        p_accountemail       IN VARCHAR, -- Must not be NULL
        p_date               IN DATE, -- If NULL, use CURRENT_DATE
        p_anonymous          IN VARCHAR, -- default value is 'yes'.
        p_displayname        IN VARCHAR,
        p_giveemail          IN VARCHAR, -- default value is 'no'
        p_billingfirstname   IN VARCHAR,
        p_billinglastname    IN VARCHAR, -- must not be NULL
        p_billingaddress     IN VARCHAR, -- must not be NULL
        p_billingstate       IN VARCHAR, -- must not be NULL
        p_zipcode            IN VARCHAR, -- must not be NULL
        p_country            IN VARCHAR, -- must not be NULL
        p_creditcard         IN VARCHAR, -- must not be NULL
        p_expmonth           IN NUMBER, -- must not be NULL
        p_expyear            IN NUMBER, -- must be > 2015
        p_seccode            IN NUMBER, -- must not be NULL
        p_ordernumber        OUT NUMBER
    ) IS

        lv_ordernumber   NUMBER := NULL;
        lv_date          DATE := p_date;
        lv_amount        NUMBER := NULL;
        lv_anon          VARCHAR(50) := p_anonymous;
        lv_givemail      VARCHAR(50) := p_giveemail;
        lv_projectid     NUMBER := NULL;
        ex_error EXCEPTION;
        errmsg_txt       VARCHAR(100) := NULL;
        var_acc          i_account.account_id%TYPE := NULL;
    BEGIN
        SELECT
            account_id
        INTO
            var_acc
        FROM
            i_account
        WHERE
            account_email = p_accountemail;

        SELECT
            project_id
        INTO
            lv_projectid
        FROM
            i_cart
        WHERE
            account_id = var_acc;

        SELECT
            amount
        INTO
            lv_amount
        FROM
            i_cart
        WHERE
            account_id = var_acc
            AND   project_id = lv_projectid;

        IF
            p_date IS NULL
        THEN
            lv_date := SYSDATE;
        ELSIF p_billinglastname IS NULL THEN
            errmsg_txt := 'Lastname must contain valid name!.';
            RAISE ex_error;
        ELSIF p_billingaddress IS NULL THEN
            errmsg_txt := 'Address cannot be empty!.';
            RAISE ex_error;
        ELSIF p_billingstate IS NULL THEN
            errmsg_txt := 'State cannot be empty!.';
            RAISE ex_error;
        ELSIF p_zipcode IS NULL THEN
            errmsg_txt := 'Zipcode cannot be empty!.';
            RAISE ex_error;
        ELSIF p_country IS NULL THEN
            errmsg_txt := 'Country cannot be empty!.';
            RAISE ex_error;
        ELSIF p_creditcard IS NULL THEN
            errmsg_txt := 'You must provide credit card number!.';
            RAISE ex_error;
        ELSIF p_expmonth IS NULL THEN
            errmsg_txt := 'You must provide credit card expiration date!.';
            RAISE ex_error;
        ELSIF p_expyear < 2015 THEN
            errmsg_txt := 'You card is not valid!.';
            RAISE ex_error;
        ELSIF p_seccode IS NULL THEN
            errmsg_txt := 'Security code cannot be empty!.';
            RAISE ex_error;
        ELSIF p_accountemail IS NULL THEN
            errmsg_txt := 'Email-address cannot be empty!.';
            RAISE ex_error;
        ELSIF p_anonymous IS NULL THEN
            lv_anon := 'yes';
        ELSIF p_giveemail IS NULL THEN
            lv_givemail := 'no';
        ELSIF p_expmonth > 12 THEN
            errmsg_txt := 'Expiration month needs to be within 1-12';
            RAISE ex_error;
        ELSIF p_expmonth < 1 THEN
            errmsg_txt := 'Expiration month needs to be within 1-12';
            RAISE ex_error;
        END IF;

        lv_ordernumber := order_sq.nextval;
        INSERT INTO skynet30.i_donation VALUES (
            lv_ordernumber,
            lv_date,
            lv_anon,
            p_displayname,
            lv_givemail,
            lv_amount,
            var_acc
        );

        COMMIT;
        INSERT INTO skynet30.i_billing VALUES (
            p_billingfirstname,
            p_country,
            p_billinglastname,
            p_billingaddress,
            NULL,
            NULL,
            p_billingstate,
            p_zipcode,
            p_creditcard,
            p_expmonth,
            p_expyear,
            p_seccode,
            lv_ordernumber
        );

        COMMIT;
        INSERT INTO i_donation_detail VALUES (
            lv_amount,
            lv_ordernumber,
            lv_projectid,
            dondetailid_sq.NEXTVAL
        );

        COMMIT;
        p_ordernumber := lv_ordernumber;
        DELETE FROM i_cart WHERE
            account_id = var_acc;

        COMMIT;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('No result found.');
            ROLLBACK;
        WHEN ex_error THEN
            dbms_output.put_line(errmsg_txt);
            ROLLBACK;
        WHEN OTHERS THEN
            dbms_output.put_line('The error code is: '
            || sqlcode);
            dbms_output.put_line('The error msg is:  '
            || sqlerrm);
            ROLLBACK;
    END checkout_pp;

    FUNCTION calc_percent_of_goal_pf (
        p_projectid IN INTEGER
    ) RETURN NUMBER IS
        lv_donation_raised   NUMBER;
        lv_donation_sum      i_donation_detail.donation_detail_amount%TYPE;
        lv_donation_goal     i_project.project_goal%TYPE;
    BEGIN
        SELECT
            project_goal
        INTO
            lv_donation_goal
        FROM
            i_project
        WHERE
            p_projectid = project_id;

        SELECT
            SUM(donation_detail_amount)
        INTO
            lv_donation_sum
        FROM
            i_donation_detail
        WHERE
            p_projectid = project_id;

        lv_donation_raised := ( lv_donation_sum ) / ( lv_donation_goal ) * 100;
        RETURN lv_donation_raised;
    END calc_percent_of_goal_pf;

    PROCEDURE status_underway_pp IS

    TYPE rec IS RECORD ( total_donation   i_donation_detail.donation_detail_amount%TYPE,
    project_id       i_donation_detail.project_id%TYPE,
    project_goal     i_project.project_goal%TYPE );
    
    TYPE tot_tab IS
        
        TABLE OF rec INDEX BY PLS_INTEGER;
    tabb             tot_tab;
    reco             rec;
    lv_ja            VARCHAR2(15);
    lv_total         NUMBER;
    no_more EXCEPTION;
    no_more2 EXCEPTION;
    PRAGMA exception_init ( no_more,-06502 );
    PRAGMA exception_init ( no_more2,-06512 );

BEGIN
    SELECT
        SUM(i_donation_detail.donation_detail_amount),
        i_donation_detail.project_id,
        i_project.project_goal
    BULK COLLECT INTO
        tabb
    FROM
        i_donation_detail,
        i_project
    WHERE
        i_project.project_id = i_donation_detail.project_id
        AND   i_project.project_status = 'Open'
    GROUP BY
        i_donation_detail.project_id,
        i_project.project_goal
    ORDER BY
        i_donation_detail.project_id;

    FOR i IN tabb.first..tabb.last LOOP
        UPDATE i_project
            SET
                project_status = 'Underway'
        WHERE
            EXISTS (
                SELECT
                    project_id
                FROM
                    i_donation_detail
                WHERE
                    i_project.project_id = ( tabb(i).project_id )
                    AND   ( tabb(i).total_donation ) >= tabb(i).project_goal
            );

        IF
            tabb(i).total_donation >= tabb(i).project_goal
        THEN
            dbms_output.put_line('Project with id: '
            || tabb(i).project_id
            || ' have reached the goal of: '
            || tabb(i).project_goal
            || ', with the sum of donations being: '
            || tabb(i).total_donation);

        END IF;

    END LOOP;

    COMMIT;
EXCEPTION
    WHEN no_more THEN
        dbms_output.put_line('No project that has status "open", have reached their project goal yet');
        ROLLBACK;
    WHEN no_more2 THEN
        dbms_output.put_line(' ');
        ROLLBACK;
        
END status_underway_pp;

END ioby3b_pkg;