-- 이름에 el이 들어가는 동물 찾기
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE ANIMAL_TYPE = "Dog" and NAME LIKE "%EL%"
ORDER BY NAME ASC;

-- 루시와 엘라 찾기
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME = "Lucy" OR NAME = "Ella" OR NAME = "Pickle" OR NAME = "Rogan" OR NAME = "Sabrina" OR NAME = "Mitty"
ORDER BY ANIMAL_ID ASC;

-- 중성화 여부 파악하기
SELECT ANIMAL_ID, NAME,
IF(SEX_UPON_INTAKE LIKE "%Neutered%" OR SEX_UPON_INTAKE LIKE "%Spayed%", 'O', 'X') -- IF(조건, 맞, 틀)
AS '중성화'
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;

-- 오랜 기간 보호한 동물(2) 
SELECT A.ANIMAL_ID, A.NAME
FROM ANIMAL_INS A, ANIMAL_OUTS B
WHERE A.ANIMAL_ID = B.ANIMAL_ID
ORDER BY B.DATETIME - A.DATETIME DESC -- DATE끼리는 연산 가능
LIMIT 2;

-- DATETIME에서 DATE로 형 변환
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS 날짜 -- 형식도 대소문자 구분
FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC;