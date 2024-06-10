CREATE TABLE ARTICLE (
    Article_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    Date_recvd DATE,
    Text TEXT,
    Decision VARCHAR(100),
    Date_of_decision DATE,
    comment TEXT,
    Issue_num INT,
    Original_ID INT,
    FOREIGN KEY (Issue_num) REFERENCES ISSUE(Issue_num),
    FOREIGN KEY (Original_ID) REFERENCES ARTICLE(Article_ID)
);

CREATE TABLE REVIEW (
    Review_ID INT PRIMARY KEY,
    Date_sent DATE,
    Date_reminded DATE,
    Date_received DATE,
    Text_of_review TEXT,
    Decision VARCHAR(100),
    Article_ID INT,
    R_ID INT,
    FOREIGN KEY (Article_ID) REFERENCES ARTICLE(Article_ID),
    FOREIGN KEY (R_ID) REFERENCES RESEARCHER(R_ID)
);

CREATE TABLE RESEARCHER (
    R_ID INT PRIMARY KEY,
    Fname VARCHAR(100),
    Middle_Initial CHAR(1),
    Lname VARCHAR(100),
    Title VARCHAR(100),
    Employer VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip VARCHAR(10),
    Country VARCHAR(100),
    Phone VARCHAR(15),
    Fax VARCHAR(15),
    Email VARCHAR(100),
    URL VARCHAR(255)
);

CREATE TABLE AUTHOR (
    R_ID INT PRIMARY KEY,
    Specialty VARCHAR(255),
    Rank VARCHAR(100),
    FOREIGN KEY (R_ID) REFERENCES RESEARCHER(R_ID)
);

CREATE TABLE ISSUE (
    Issue_num INT PRIMARY KEY,
    Issue_date DATE,
    Issue_num_pages INT,
    Title VARCHAR(255)
);

CREATE TABLE SPECIALTY (
    S_code INT PRIMARY KEY,
    comment TEXT
);

CREATE TABLE RS_LINK (
    R_ID INT,
    S_code INT,
    PRIMARY KEY (R_ID, S_code),
    FOREIGN KEY (R_ID) REFERENCES RESEARCHER(R_ID),
    FOREIGN KEY (S_code) REFERENCES SPECIALTY(S_code)
);

CREATE TABLE AUTHORSHIP (
    R_ID INT,
    Paper_ID INT,
    PRIMARY KEY (R_ID, Paper_ID),
    FOREIGN KEY (R_ID) REFERENCES RESEARCHER(R_ID),
    FOREIGN KEY (Paper_ID) REFERENCES ARTICLE(Article_ID)
);
