CREATE FUNCTION fnc_trg_person_update_audit()
    RETURNS TRIGGER AS
    $BODY$
BEGIN
INSERT INTO person_audit
VALUES (CURRENT_TIMESTAMP, 'U', old.id, old.name, old.age, old.gender, old.address);
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person
SET name = 'Bulat'
WHERE id = 10;

UPDATE person
SET name = 'Damir'
WHERE id = 10;