CREATE FUNCTION fnc_trg_person_delete_audit()
    RETURNS TRIGGER AS
    $BODY$
BEGIN
INSERT INTO person_audit
VALUES (CURRENT_TIMESTAMP, 'D', old.id, old.name, old.age, old.gender, old.address);
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_delete_audit();


DELETE
FROM person
WHERE id = 10;