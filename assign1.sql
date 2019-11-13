CREATE TABLE User (
	EmailAddress CHAR(128),
	Name         CHAR(128),
	Address      CHAR(128),
	PhoneNo      CHAR(128),
	Affiliation  CHAR(128),
	
	PRIMARY KEY (EmailAddress)
);

CREATE TABLE Author (
	EmailAddress CHAR(128) NOT NULL,
	PRIMARY KEY (EmailAddress),
	FOREIGN KEY (EmailAddress) REFERENCES User,
	ON DELETE CASCADE
);

CREATE TABLE Reviewer (
	EmailAddress CHAR(128) NOT NULL,
	PRIMARY KEY (EmailAddress),
	FOREIGN KEY (EmailAddress) REFERENCES User,
	
	ON DELETE CASCADE
);

CREATE TABLE Paper_Presented (
	PID     INTEGER,
	Title   CHAR(128),
	URL     CHAR(128),
	Status  CHAR(128),
	Mark    Integer,
	ConfID Integer NOT NULL,
	
	PRIMARY KEY (PID),
	FOREIGN KEY (ConfID) REFERENCES Conference,
);

CREATE TABLE Submit (
	EmailAddress CHAR(128),
	PID          Integer,
	SubmitDate   Date,


	PRIMARY KEY (PID, EmailAddress),
	FOREIGN KEY (EmailAddress) REFERENCES Author,
	FOREIGN KEY (PID         ) REFERENCES Paper_Presented
);

CREATE TABLE Review (
	EmailAddress CHAR(128),
	PID          Integer,
	Justification CHAR(128),
	OverallMark   Integer,
	Originality   CHAR(128),
	Soundness     CHAR(128),
	Importance    CHAR(128),
	PRIMARY KEY (PID, EmailAddress),
	FOREIGN KEY (EmailAddress) REFERENCES Reviewer,
	FOREIGN KEY (PID         ) REFERENCES Paper_Presented
);

CREATE TABLE Conference (
	ConfID       Integer NOT NULL,
	CutOffMark   Integer,
	StartDate    Date,
	EndDate      Date,
	Title        CHAR(128),
	
	PRIMARY KEY (ConfID)
);

CREATE TABLE ConfSection (
	SectionName        CHAR(128),
	ConfID Integer NOT NULL,
	EmailAddress CHAR(128) NOT NULL,
	
	PRIMARY KEY (SectionName,ConfID,EmailAddress),
	FOREIGN KEY (ConfID) REFERENCES Conference,
	FOREIGN KEY (EmailAddress) REFERENCES Reviewer
	ON DELETE CASCADE
);

CREATE TABLE IsChairOf (
	EmailAddress CHAR(128),
	ConfID       Integer,

	PRIMARY KEY(EmailAddress, ConfID),
	FOREIGN KEY (EmailAddress) REFERENCES Reviewer,
	FOREIGN KEY (ConfID      ) REFERENCES Conference
);
CREATE TABLE Participate (
       ConfID Integer,
       EmailAddress CHAR(128);
       PRIMARY KEY(EmailAddress,ConfID),
       FOREIGN KEY (EmailAddress) REFERENCES Reviewer,
       FOREIGN Key (ConfID) REFERENCES Conference

);
