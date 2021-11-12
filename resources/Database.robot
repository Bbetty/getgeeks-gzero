*Settings*
Documentation    Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py



*Keywords*
Connect To Postgress
    Connect To Database    psycopg2
    ...                    rfclzdcd
    ...                    rfclzdcd
    ...                    AmTPqiZwLsB-Fv3ZhIKRLWHz1VzLv5MC
    ...                    fanny.db.elephantsql.com
    ...                    5432


Reset Env Database
    Execute SQL String    DELETE from public.geeks;
    Execute SQL String    DELETE from public.users;


Insert User Database
    [Arguments]    ${u}

    ${hashed_pass}    Get Hashed Pass     ${u}[password]

    ${q}    Set Variable    INSERT INTO public.users (email, password_hash, name, is_geek) values ('${u}[email]', '${hashed_pass}','${u}[name] ${u}[lastname]',false);    

    Execute SQL String    ${q}


Users Seed

    ${user}     Factory Login User
    Insert User Database     ${user}

    ${geek}     Factory User Be Geek
    Insert User Database     ${geek}


