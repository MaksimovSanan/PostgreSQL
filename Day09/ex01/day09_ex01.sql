CREATE OR REPLACE FUNCTION FNC_TRG_PERSON_UPDATE_AUDIT
() RETURNS TRIGGER AS $$ 
	BEGIN IF TG_OP = 'UPDATE' THEN
	INSERT INTO
	    person_audit (
	        type_event,
	        row_id,
	        name,
	        age,
	        gender,
	        address
	    )
	VALUES (
	        'U',
	        OLD.id,
	        OLD.name,
	        OLD.age,
	        OLD.gender,
	        OLD.address
	    );
	END IF;
	RETURN NEW;
	END;
	$$ LANGUAGE 
PLPGSQL; 

CREATE TRIGGER TRG_PERSON_UPDATE_AUDIT 
	AFTER
	UPDATE ON person FOR EACH ROW
	EXECUTE
	    FUNCTION fnc_trg_person_update_audit();
; 

UPDATE person SET name = 'Bulat' WHERE id = 10;

UPDATE person SET name = 'Damir' WHERE id = 10;

SELECT * FROM person_audit ;