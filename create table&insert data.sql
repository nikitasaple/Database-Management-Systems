/*
Created: 3/7/2016
Modified: 4/22/2016
Model: Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/


-- Create tables section -------------------------------------------------

-- Table Patient

CREATE TABLE [Patient]
(
 [PatientID] Int NOT NULL,
 [PFirstName] Char(10) NOT NULL,
 [PLastName] Char(10) NOT NULL,
 [DOB] Date NOT NULL,
 [Gender] Char(10) NOT NULL,
 [PrimaryCarePhysician] Char(35) NULL,
 [Contact] Char(10) NULL,
 [HealthcareProxyFormLink] Varchar(500) NULL
)
go

-- Add keys for table Patient

ALTER TABLE [Patient] ADD CONSTRAINT [Key1] PRIMARY KEY ([PatientID])
go

-- Table Doctor

CREATE TABLE [Doctor]
(
 [NPID] Bigint NOT NULL,
 [DFirstName] Char(10) NOT NULL,
 [DLastName] Char(10) NOT NULL,
 [Contact] Char(10) NOT NULL
)
go

-- Add keys for table Doctor

ALTER TABLE [Doctor] ADD CONSTRAINT [Key2] PRIMARY KEY ([NPID])
go

-- Table MedicationDetails

CREATE TABLE [MedicationDetails]
(
 [MedicationDetailID] Int NOT NULL,
 [Dosage] Char(20) NULL,
 [MedicationName] Varchar(500) NULL,
 [MedicationType] Varchar(50) NULL
)
go

-- Add keys for table MedicationDetails

ALTER TABLE [MedicationDetails] ADD CONSTRAINT [Key3] PRIMARY KEY ([MedicationDetailID])
go

-- Table TestDetails

CREATE TABLE [TestDetails]
(
 [TestID] Int NOT NULL,
 [EventID] Int NOT NULL,
 [StandardID] Int NOT NULL,
 [TName] Varchar(50) NOT NULL,
 [TestResult] Varchar(10) NOT NULL,
 [Value] Char(10) NOT NULL
)
go

-- Create indexes for table TestDetails

CREATE INDEX [IX_Relationship1] ON [TestDetails] ([EventID])
go

CREATE INDEX [IX_Relationship2] ON [TestDetails] ([StandardID])
go

-- Add keys for table TestDetails

ALTER TABLE [TestDetails] ADD CONSTRAINT [Key4] PRIMARY KEY ([TestID])
go

-- Table InsurancePlan

CREATE TABLE [InsurancePlan]
(
 [InsurancePlanID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [InsuranceCompany] Char(50) NOT NULL,
 [InsuranceNumber] Int NOT NULL,
 [InsurancePlanDetails] Varchar(max) NOT NULL,
 [EffectiveDate] Date NOT NULL,
 [ExpiryDate] Date NOT NULL
)
go

-- Create indexes for table InsurancePlan

CREATE INDEX [IX_Relationship16] ON [InsurancePlan] ([PatientID])
go

-- Add keys for table InsurancePlan

ALTER TABLE [InsurancePlan] ADD CONSTRAINT [Key9] PRIMARY KEY ([InsurancePlanID])
go

-- Table VitalSet

CREATE TABLE [VitalSet]
(
 [VitalRecordID] Int NOT NULL,
 [EventID] Int NOT NULL,
 [HeartRate] Int NOT NULL,
 [RespiratoryRate] Int NOT NULL,
 [BloodPressure] Int NOT NULL,
 [Date] Datetime NOT NULL
)
go

-- Create indexes for table VitalSet

CREATE INDEX [IX_Relationship15] ON [VitalSet] ([EventID])
go

-- Add keys for table VitalSet

ALTER TABLE [VitalSet] ADD CONSTRAINT [Key10] PRIMARY KEY ([VitalRecordID])
go

-- Table Event

CREATE TABLE [Event]
(
 [EventID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [EventDate] Datetime NOT NULL,
 [EventType] Char(20) NOT NULL,
 [Location] Varchar(50) NULL
)
go

-- Create indexes for table Event

CREATE INDEX [IX_Relationship7] ON [Event] ([PatientID])
go

-- Add keys for table Event

ALTER TABLE [Event] ADD CONSTRAINT [Key11] PRIMARY KEY ([EventID])
go

-- Table Staff

CREATE TABLE [Staff]
(
 [StaffID] Int NOT NULL,
 [StFirstName] Char(10) NOT NULL,
 [StLastName] Char(10) NOT NULL,
 [Contact] Char(10) NOT NULL
)
go

-- Add keys for table Staff

ALTER TABLE [Staff] ADD CONSTRAINT [Key12] PRIMARY KEY ([StaffID])
go

-- Table Surrogate

CREATE TABLE [Surrogate]
(
 [SurrogateID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [SFirstName] Char(10) NOT NULL,
 [SLastName] Char(10) NOT NULL,
 [Contact] Char(10) NULL
)
go

-- Create indexes for table Surrogate

CREATE INDEX [IX_Relationship17] ON [Surrogate] ([PatientID])
go

-- Add keys for table Surrogate

ALTER TABLE [Surrogate] ADD CONSTRAINT [Key13] PRIMARY KEY ([SurrogateID])
go

-- Table MedicalHistory

CREATE TABLE [MedicalHistory]
(
 [MedicalHistID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [ExistingConditions] Varchar(500) NOT NULL,
 [FamilyHistory] Varchar(max) NULL,
 [PastSurgery] Varchar(500) NULL
)
go

-- Create indexes for table MedicalHistory

CREATE INDEX [IX_Relationship2] ON [MedicalHistory] ([PatientID])
go

-- Add keys for table MedicalHistory

ALTER TABLE [MedicalHistory] ADD CONSTRAINT [Key15] PRIMARY KEY ([MedicalHistID])
go

-- Table Inpatient

CREATE TABLE [Inpatient]
(
 [InpatientID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [EventID] Int NOT NULL,
 [RoomNum] Int NOT NULL,
 [Floor] Int NOT NULL,
 [Building] Char(20) NOT NULL,
 [CheckInTime] Datetime NOT NULL,
 [CheckOutTime] Datetime NULL
)
go

-- Create indexes for table Inpatient

CREATE INDEX [IX_Relationship21] ON [Inpatient] ([EventID])
go

CREATE INDEX [IX_Relationship1] ON [Inpatient] ([PatientID])
go

-- Add keys for table Inpatient

ALTER TABLE [Inpatient] ADD CONSTRAINT [Key16] PRIMARY KEY ([InpatientID])
go

-- Table Accident

CREATE TABLE [Accident]
(
 [AccidentID] Int NOT NULL,
 [EventID] Int NOT NULL,
 [WorkInjury] Char(1) NOT NULL,
 [AccidentDesc] Varchar(500) NOT NULL,
 [EmployerName] Varchar(35) NULL,
 [EmployeeID] Int NULL
)
go

-- Create indexes for table Accident

CREATE INDEX [IX_Relationship2] ON [Accident] ([EventID])
go

-- Add keys for table Accident

ALTER TABLE [Accident] ADD CONSTRAINT [Key18] PRIMARY KEY ([AccidentID])
go

-- Table Address

CREATE TABLE [Address]
(
 [AddressID] Int NOT NULL,
 [Street] Varchar(100) NOT NULL,
 [City] Char(20) NOT NULL,
 [State] Char(2) NOT NULL,
 [Zip] Char(10) NOT NULL,
 [AddressType] Char(20) NOT NULL
)
go

-- Add keys for table Address

ALTER TABLE [Address] ADD CONSTRAINT [Key19] PRIMARY KEY ([AddressID])
go

-- Table TestImage

CREATE TABLE [TestImage]
(
 [ImageID] Int NOT NULL,
 [TestID] Int NOT NULL,
 [ImageName] Varchar(35) NOT NULL,
 [ImageType] Char(15) NOT NULL,
 [ImageSize] Decimal(12,2) NOT NULL,
 [Unit] Char(10) NOT NULL,
 [ImageLink] Varchar(500) NOT NULL
)
go

-- Create indexes for table TestImage

CREATE INDEX [IX_Relationship3] ON [TestImage] ([TestID])
go

-- Add keys for table TestImage

ALTER TABLE [TestImage] ADD CONSTRAINT [Key20] PRIMARY KEY ([ImageID])
go

-- Table StaffList

CREATE TABLE [StaffList]
(
 [EventID] Int NOT NULL,
 [StaffID] Int NOT NULL
)
go

-- Add keys for table StaffList

ALTER TABLE [StaffList] ADD CONSTRAINT [Key21] PRIMARY KEY ([EventID],[StaffID])
go

-- Table ProcedureCost

CREATE TABLE [ProcedureCost]
(
 [CostID] Int NOT NULL,
 [MedicationDetailID] Int NOT NULL,
 [Amount] Money NOT NULL,
 [CostType] Varchar(20) NOT NULL
)
go

-- Create indexes for table ProcedureCost

CREATE INDEX [IX_Relationship1] ON [ProcedureCost] ([MedicationDetailID])
go

-- Add keys for table ProcedureCost

ALTER TABLE [ProcedureCost] ADD CONSTRAINT [Key22] PRIMARY KEY ([CostID])
go

-- Table DoctorList

CREATE TABLE [DoctorList]
(
 [EventID] Int NOT NULL,
 [NPID] Bigint NOT NULL
)
go

-- Add keys for table DoctorList

ALTER TABLE [DoctorList] ADD CONSTRAINT [Key23] PRIMARY KEY ([EventID],[NPID])
go

-- Table TestStandard

CREATE TABLE [TestStandard]
(
 [StandardID] Int NOT NULL,
 [TestName] Varchar(50) NOT NULL,
 [TestItem] Varchar(10) NOT NULL,
 [LowRange] Decimal(12,2) NOT NULL,
 [HighRange] Decimal(12,2) NOT NULL,
 [Unit] Char(10) NOT NULL
)
go

-- Add keys for table TestStandard

ALTER TABLE [TestStandard] ADD CONSTRAINT [Key24] PRIMARY KEY ([StandardID])
go

-- Table AddressType

CREATE TABLE [AddressType]
(
 [PatientID] Int NOT NULL,
 [AddressID] Int NOT NULL
)
go

-- Add keys for table AddressType

ALTER TABLE [AddressType] ADD CONSTRAINT [Key25] PRIMARY KEY ([PatientID],[AddressID])
go

-- Table Allergy

CREATE TABLE [Allergy]
(
 [AllergyID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [AllergyName] Char(50) NOT NULL,
 [AllergyDesc] Varchar(500) NULL
)
go

-- Create indexes for table Allergy

CREATE INDEX [IX_Relationship13] ON [Allergy] ([PatientID])
go

-- Add keys for table Allergy

ALTER TABLE [Allergy] ADD CONSTRAINT [Key26] PRIMARY KEY ([AllergyID])
go

-- Table Immunization

CREATE TABLE [Immunization]
(
 [ImmunizationID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [ImmunizationName] Char(50) NOT NULL,
 [ImmunizationDesc] Varchar(500) NULL
)
go

-- Create indexes for table Immunization

CREATE INDEX [IX_Relationship14] ON [Immunization] ([PatientID])
go

-- Add keys for table Immunization

ALTER TABLE [Immunization] ADD CONSTRAINT [Key27] PRIMARY KEY ([ImmunizationID])
go

-- Table Disability

CREATE TABLE [Disability]
(
 [DisabilityID] Int NOT NULL,
 [PatientID] Int NOT NULL,
 [DisabilityName] Char(50) NOT NULL,
 [DisabilityDesc] Varchar(500) NULL
)
go

-- Create indexes for table Disability

CREATE INDEX [IX_Relationship16] ON [Disability] ([PatientID])
go

-- Add keys for table Disability

ALTER TABLE [Disability] ADD CONSTRAINT [Key28] PRIMARY KEY ([DisabilityID])
go

-- Table Prescription

CREATE TABLE [Prescription]
(
 [EventID] Int NOT NULL,
 [MedicationDetailID] Int NOT NULL
)
go

-- Add keys for table Prescription

ALTER TABLE [Prescription] ADD CONSTRAINT [Key29] PRIMARY KEY ([EventID],[MedicationDetailID])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [MedicalHistory] ADD CONSTRAINT [has] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Event] ADD CONSTRAINT [undergoes] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [VitalSet] ADD CONSTRAINT [includes2] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [InsurancePlan] ADD CONSTRAINT [owns] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Surrogate] ADD CONSTRAINT [account for] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [StaffList] ADD CONSTRAINT [executed by] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [StaffList] ADD CONSTRAINT [includes1] FOREIGN KEY ([StaffID]) REFERENCES [Staff] ([StaffID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Inpatient] ADD CONSTRAINT [is encountered by] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Inpatient] ADD CONSTRAINT [may be] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [DoctorList] ADD CONSTRAINT [ordered by] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [DoctorList] ADD CONSTRAINT [includes3] FOREIGN KEY ([NPID]) REFERENCES [Doctor] ([NPID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [AddressType] ADD CONSTRAINT [resides] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [AddressType] ADD CONSTRAINT [contained in] FOREIGN KEY ([AddressID]) REFERENCES [Address] ([AddressID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Allergy] ADD CONSTRAINT [may have] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Immunization] ADD CONSTRAINT [may be injected] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Disability] ADD CONSTRAINT [suffers from] FOREIGN KEY ([PatientID]) REFERENCES [Patient] ([PatientID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Prescription] ADD CONSTRAINT [prescribed] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Prescription] ADD CONSTRAINT [have] FOREIGN KEY ([MedicationDetailID]) REFERENCES [MedicationDetails] ([MedicationDetailID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ProcedureCost] ADD CONSTRAINT [bills] FOREIGN KEY ([MedicationDetailID]) REFERENCES [MedicationDetails] ([MedicationDetailID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Accident] ADD CONSTRAINT [report] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TestDetails] ADD CONSTRAINT [allocate] FOREIGN KEY ([EventID]) REFERENCES [Event] ([EventID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TestDetails] ADD CONSTRAINT [refer to] FOREIGN KEY ([StandardID]) REFERENCES [TestStandard] ([StandardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TestImage] ADD CONSTRAINT [generate] FOREIGN KEY ([TestID]) REFERENCES [TestDetails] ([TestID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



INSERT INTO Staff VALUES ('85988','Nina','Hudson','1234567090')
INSERT INTO Staff VALUES ('85989','David','John','2234567190')
INSERT INTO Staff VALUES ('85990','Ann','Johnson','4234567820')
INSERT INTO Staff VALUES ('85991','Rajes','Haward','3234557890')
INSERT INTO Staff VALUES ('85992','Sheldon','Kennedy','5234563890')
INSERT INTO Staff VALUES ('85993','Leo','Lawrence','7134567890')
INSERT INTO Staff VALUES ('85994','Amy','July','6238567890')
INSERT INTO Staff VALUES ('85995','Slyvia','Wang','8234537890')
INSERT INTO Staff VALUES ('85996','Kimi','Lee','0233567890')
INSERT INTO Staff VALUES ('85997','Rayna','Myra','9264567890')


INSERT INTO Patient VALUES ('749301','Ann','Johnson','1979','Female','Anna Kupper','7362356221','https://healthcare.org/Healthcare_proxy')
INSERT INTO Patient VALUES ('749302','Rayna','Myra','1988-06-11','Female','Yisheng Wang','6172248322','https://healthcare.org/WANG/Healthcare_proxy')
INSERT INTO Patient VALUES ('749303','Kimi','Lee','1992-03-09','Male','','3141182122','https://healthcare.org/LREWHealthcare_proxy')
INSERT INTO Patient VALUES ('749304','Sylvia','Wang','1989-12-11','Female','David Johnson','6172222537','https://healthcare.org/EWET/Healthcare_proxy')
INSERT INTO Patient VALUES ('749305','Amy','July','1989-02-04','Female','David Lawrence','6172222372','https://healthcare.org/SDGSFG/Healthcare_proxy')
INSERT INTO Patient VALUES ('749306','Leo','Lawrence','1993-01-01','Male','Ann Edison','6172224275','')
INSERT INTO Patient VALUES ('749307','Sheldon','Kennedy','1978-01-12','Male',' Katherin Lee','6175372227','https://healthcare.org/AERHEH/Healthcare_proxy')
INSERT INTO Patient VALUES ('749308','Rajes','Haward','1966-02-20','Male','David Willian','6172126521','https://healthcare.org/HSTDJNF/Healthcare_proxy')
INSERT INTO Patient VALUES ('749309','David','John','1956-02-25','Male','','6172122672','https://healthcare.org/ZDGNHFGMJ/Healthcare_proxy')
INSERT INTO Patient VALUES ('749310','Nina','Johnson','2000-03-11','Female','','5042223422','https://healthcare.org/EQWRWET/Healthcare_proxy')
INSERT INTO Patient VALUES ('749311','Helen','Edison','2006-06-01','Female','','6177583852','')


INSERT INTO InsurancePlan VALUES ('2049571','749301','eHealthMedicare','73847364','Monthly Premium:$170.59. Annual Deductible:Part A: $1,288 Part B: $166. Doctor/Hospital Choice: Any Doctor or medical provider that accepts Medicare. Office Visit: No charge after Part B deductible. Out-of-Pocket Max: No Limit.','2011-03-17','2018-03-17')
INSERT INTO InsurancePlan VALUES ('2049572','749303','HealthPlans','847384947','DeductibleIndividual: $3,000.Coinsurance: 20% after deductible. Coinsurance Limit: $0. Maximum Lifetime Coverage:$100,000. Out of Pocket Limit: $10,000','2015-06-11','2016-06-11')
INSERT INTO InsurancePlan VALUES ('2049573','749306','Blue Cross Blue Shield of Massachusetts','485475885','• $4,900 for services you receive from in-network providers. • $4,900 for services you receive from any provider. Your limit for services received from in-network providers will count toward this limit.','2016-03-09','2017-03-09')
INSERT INTO InsurancePlan VALUES ('2049574','749302','eHealthMedicare','45346364','Monthly Premium:$170.59. Annual Deductible:Part A: $1,288 Part B: $166. Doctor/Hospital Choice: Any Doctor or medical provider that accepts Medicare. Office Visit: No charge after Part B deductible. Out-of-Pocket Max: No Limit.','2011-12-11','2017-12-11')
INSERT INTO InsurancePlan VALUES ('2049575','749308','Blue Cross Blue Shield of Massachusetts','45345538','• $4,900 for services you receive from in-network providers. • $4,900 for services you receive from any provider. Your limit for services received from in-network providers will count toward this limit.','2010-02-04','2016-07-04')
INSERT INTO InsurancePlan VALUES ('2049576','749310','eHealthMedicare','36234646','Monthly Premium:$170.59. Annual Deductible:Part A: $1,288 Part B: $166. Doctor/Hospital Choice: Any Doctor or medical provider that accepts Medicare. Office Visit: No charge after Part B deductible. Out-of-Pocket Max: No Limit.','2005-01-01','2025-01-01')
INSERT INTO InsurancePlan VALUES ('2049577','749309','HealthPlans','48373726','DeductibleIndividual: $5,000.Coinsurance: 20% after deductible. Coinsurance Limit: $0. Maximum Lifetime Coverage:$100,000. Out of Pocket Limit: $10,000','2008-01-12','2018-01-12')
INSERT INTO InsurancePlan VALUES ('2049578','749305','HealthPlans','9312385','DeductibleIndividual: $2,000.Coinsurance: 20% after deductible. Coinsurance Limit: $0. Maximum Lifetime Coverage:$100,000. Out of Pocket Limit: $10,000','2008-02-20','2017-02-20')
INSERT INTO InsurancePlan VALUES ('2049579','749304','eHealthMedicare','3847364','Monthly Premium:$170.59. Annual Deductible:Part A: $1,288 Part B: $166. Doctor/Hospital Choice: Any Doctor or medical provider that accepts Medicare. Office Visit: No charge after Part B deductible. Out-of-Pocket Max: No Limit.','2014-02-25','2019-02-25')
INSERT INTO InsurancePlan VALUES ('2049580','749311','Blue Cross Blue Shield of Massachusetts','42955098','• $5,000 for services you receive from in-network providers. • $5,000 for services you receive from any provider. Your limit for services received from in-network providers will count toward this limit.','2014-08-15','2016-08-15')



INSERT INTO Surrogate VALUES ('6495721','749302','Leo','Lawrence','1265725090')
INSERT INTO Surrogate VALUES ('6495722','749307','Jenifer','Judy','5134587820')
INSERT INTO Surrogate VALUES ('6495723','749304','Ann','Johnson','5134587820')
INSERT INTO Surrogate VALUES ('6495724','749303','Rayna','Myra','3132217890')
INSERT INTO Surrogate VALUES ('6495725','749305','Sheldon','Kennedy','5234612090')
INSERT INTO Surrogate VALUES ('6495726','749310','Nina','Hudson','7134567999')
INSERT INTO Surrogate VALUES ('6495727','749309','Amy','July','6237667890')
INSERT INTO Surrogate VALUES ('6495728','749301','David','John','6177537890')
INSERT INTO Surrogate VALUES ('6495729','749306','Kimi','Lee','3153567890')
INSERT INTO Surrogate VALUES ('6495730','749308','Rajes','Haward','4094567890')
INSERT INTO Surrogate VALUES ('6495731','749311','Harry','Potter','')


INSERT INTO Address VALUES ('3843216','12 Husdson St','New York','NY','10090','Home Address')
INSERT INTO Address VALUES ('3843217','1 Washionton St','New Orleans','LA','87820','Work Address')
INSERT INTO Address VALUES ('3843218','45 Huntinton St','Los Angeles','CA','10345-7820','Work Address')
INSERT INTO Address VALUES ('3843219','37 Edison St','Quincy','MA','02122-7890','Home Address')
INSERT INTO Address VALUES ('3843220','65 Apple St','Medford','MA','02090','Work Address')
INSERT INTO Address VALUES ('3843221','106 Main St','New York','NY','10999','Work Address')
INSERT INTO Address VALUES ('3843222','96 Concord St','Boston','MA','02376-7890','Home Address')
INSERT INTO Address VALUES ('3843223','123 May St','San Fransico','CA','11890','Home Address')
INSERT INTO Address VALUES ('3843224','77 Bicon St','Las Vegas','NV','44890','Work Address')
INSERT INTO Address VALUES ('3843225','80 Wall St','Boston','MA','02890','Home Address')
INSERT INTO Address VALUES ('3843226','120 Huntinton St','Boston','MA','02115','Home Address')


INSERT INTO AddressType VALUES ('749301','3843221')
INSERT INTO AddressType VALUES ('749302','3843222')
INSERT INTO AddressType VALUES ('749303','3843218')
INSERT INTO AddressType VALUES ('749304','3843224')
INSERT INTO AddressType VALUES ('749305','3843225')
INSERT INTO AddressType VALUES ('749306','3843216')
INSERT INTO AddressType VALUES ('749307','3843219')
INSERT INTO AddressType VALUES ('749308','3843217')
INSERT INTO AddressType VALUES ('749309','3843223')
INSERT INTO AddressType VALUES ('749310','3843220')
INSERT INTO AddressType VALUES ('749311','3843226')


INSERT INTO Allergy VALUES ('71263','749308','Adenoids','An exaggerated response to a substance or condition produced by the release of histamine or histamine-like substances in affected cells in the body.')
INSERT INTO Allergy VALUES ('71364','749305','Anaphylaxis','Severe, life-threatening allergic response that may include lowered blood pressure, swelling, and hives.')
INSERT INTO Allergy VALUES ('71365','749304','Dust mites','Microscopic insects that live in household dust and are common allergens.')
INSERT INTO Allergy VALUES ('71366','749303','Hay fever','Allergic reaction caused by the pollens of ragweed, grasses, and other plants whose pollen is spread by the wind.')
INSERT INTO Allergy VALUES ('71367','749302','Dermatitis','Inflammation of the skin, either due to direct contact with an irritating substance or to an allergic reaction. Symptoms include redness, itching, and sometimes blistering.')
INSERT INTO Allergy VALUES ('71368','749307','Anaphylaxis','Severe, life-threatening allergic response that may include lowered blood pressure, swelling, and hives.')
INSERT INTO Allergy VALUES ('71369','749309','Hay fever','Allergic reaction caused by the pollens of ragweed, grasses, and other plants whose pollen is spread by the wind.')
INSERT INTO Allergy VALUES ('71370','749306','Onion allergy','Allergic reaction caused by Onion')
INSERT INTO Allergy VALUES ('71371','749301','Anaphylaxis','Severe, life-threatening allergic response that may include lowered blood pressure, swelling, and hives.')


INSERT INTO Immunization VALUES ('62621','749301','Pertussis vaccine','A vaccine that protects against whooping cough.')
INSERT INTO Immunization VALUES ('62622','749305','Hepatitis B Vaccine','A vaccine that prevents hepatitis B.')
INSERT INTO Immunization VALUES ('62623','749304','Hepatitis B Vaccine','A vaccine that prevents hepatitis B.')
INSERT INTO Immunization VALUES ('62624','749310','Measles Vaccine','A vaccine that is very effective at preventing measles.')
INSERT INTO Immunization VALUES ('62625','749306','Mumps Vaccine','Mumps vaccines are vaccines which prevent mumps.')
INSERT INTO Immunization VALUES ('62626','749308','Pertussis vaccine','A vaccine that protects against whooping cough.')
INSERT INTO Immunization VALUES ('62627','749309','Hepatitis B Vaccine','A vaccine that prevents hepatitis B.')
INSERT INTO Immunization VALUES ('62628','749302','Mumps Vaccine','Mumps vaccines are vaccines which prevent mumps.')
INSERT INTO Immunization VALUES ('62629','749307','Hepatitis B Vaccine','A vaccine that prevents hepatitis B.')
INSERT INTO Immunization VALUES ('62630','749303','Pertussis vaccine','A vaccine that protects against whooping cough.')
INSERT INTO Immunization VALUES ('62631','749311','Mumps Vaccine','Mumps vaccines are vaccines which prevent mumps.')


INSERT INTO Disability VALUES ('50827','749301','Deaf','')
INSERT INTO Disability VALUES ('50828','749309','Deaf','')
INSERT INTO Disability VALUES ('50829','749304','Idiot','A person with an IQ of 0–30.')
INSERT INTO Disability VALUES ('50830','749303','Blind','')
INSERT INTO Disability VALUES ('50831','749306','Deaf','')
INSERT INTO Disability VALUES ('50832','749310','Idiot','A person with an IQ of 0–30.')
INSERT INTO Disability VALUES ('50833','749309','Blind','')
INSERT INTO Disability VALUES ('50834','749305','Deaf','')



INSERT INTO MedicalHistory VALUES ('48991','749307','Having a fever. Body temperature:39 C.','','')
INSERT INTO MedicalHistory VALUES ('48992','749310','No obvious symptom.','','')
INSERT INTO MedicalHistory VALUES ('48993','749302','Having rashes over left leg.','','Appendicitis surgery')
INSERT INTO MedicalHistory VALUES ('48994','749303','Having a fever. Body temperature:38 C.','','Appendicitis surgery')
INSERT INTO MedicalHistory VALUES ('48995','749306','Nose injury.','','Gastrectomy')
INSERT INTO MedicalHistory VALUES ('48996','749301','Having rashes over neck.','','')
INSERT INTO MedicalHistory VALUES ('48997','749309','Having a fever. Body temperature:39.5 C.','Father has diabetes','')
INSERT INTO MedicalHistory VALUES ('48998','749304','Left eye injury.','','')
INSERT INTO MedicalHistory VALUES ('48999','749308','No obvious symptom.','','')
INSERT INTO MedicalHistory VALUES ('49000','749305','Having a fever. Body temperature:38.5 C.','','Gastrectomy')


INSERT INTO Event VALUES ('384661','749305','2016-01-14 10:30:00','Blood Test','215 Edison Building')
INSERT INTO Event VALUES ('384662','749301','2016-01-14 11:03:59','Physical Exam','308 Harward Building')
INSERT INTO Event VALUES ('384663','749308','2016-01-14 15:09:01','Physical Exam','308 Harward Building')
INSERT INTO Event VALUES ('384664','749303','2016-01-14 15:40:29','Blood Test','215 Edison Building')
INSERT INTO Event VALUES ('384665','749306','2016-02-01 20:20:48','Urine Test','510 Lenard Building')
INSERT INTO Event VALUES ('384666','749307','2016-04-17 23:18:11','Endocrine Test','103 Endocrine Building')
INSERT INTO Event VALUES ('384667','749309','2016-04-18 18:20:55','Physical Exam','308 Harward Building')
INSERT INTO Event VALUES ('384668','749302','2016-04-19 14:20:30','Endocrine Test','103 Endocrine Building')
INSERT INTO Event VALUES ('384669','749310','2016-04-20 19:43:11','Blood Test','215 Edison Building')
INSERT INTO Event VALUES ('384670','749304','2016-04-22 18:30:32','Endocrine Test','103 Endocrine Building')
INSERT INTO Event VALUES ('384671','749311','2016-04-22 22:41:29','Visit','101 Ell Building')


INSERT INTO StaffList VALUES ('384661','85996')
INSERT INTO StaffList VALUES ('384662','85990')
INSERT INTO StaffList VALUES ('384663','85991')
INSERT INTO StaffList VALUES ('384664','85995')
INSERT INTO StaffList VALUES ('384665','85993')
INSERT INTO StaffList VALUES ('384666','85994')
INSERT INTO StaffList VALUES ('384667','85989')
INSERT INTO StaffList VALUES ('384668','85992')
INSERT INTO StaffList VALUES ('384669','85997')
INSERT INTO StaffList VALUES ('384670','85988')


INSERT INTO Inpatient VALUES ('83669','749309','384664','306','3','Johson Building','2016-01-14','2016-01-28')
INSERT INTO Inpatient VALUES ('83670','749301','384665','409','4','Washinton Building','2016-02-02','')
INSERT INTO Inpatient VALUES ('83671','749308','384662','613','6','Johson Building','2016-01-14','2016-02-14')
INSERT INTO Inpatient VALUES ('83672','749306','384670','210','2','Washinton Building','2016-03-11','')
INSERT INTO Inpatient VALUES ('83673','749307','384668','716','7','Johson Building','2016-04-19','2016-05-19')
INSERT INTO Inpatient VALUES ('83674','749302','384661','313','3','Washinton Building','2016-04-19','')
INSERT INTO Inpatient VALUES ('83675','749305','384663','505','5','Johson Building','2016-04-19','2016-05-03')
INSERT INTO Inpatient VALUES ('83676','749303','384666','609','6','Johson Building','2016-04-20','')
INSERT INTO Inpatient VALUES ('83677','749304','384669','309','3','Johson Building','2016-04-22','')


INSERT INTO Doctor VALUES ('9385738593','Nina','Hudson','1234534090')
INSERT INTO Doctor VALUES ('2238475847','Leo','John','2237657190')
INSERT INTO Doctor VALUES ('1238294735','Ann','Johnson','3134567820')
INSERT INTO Doctor VALUES ('4382957364','Slyvia','Haward','3237657890')
INSERT INTO Doctor VALUES ('3235146345','Sheldon','Myra','5239863890')
INSERT INTO Doctor VALUES ('4253464654','David','Lawrence','7130067890')
INSERT INTO Doctor VALUES ('3423524643','Amy','July','6233167890')
INSERT INTO Doctor VALUES ('8789472391','Rajes','Wang','6134537890')
INSERT INTO Doctor VALUES ('5903550285','Kimi','Lee','6173567890')
INSERT INTO Doctor VALUES ('1038395839','Rayna','Kennedy','8174567890')


INSERT INTO DoctorList VALUES ('384661','9385738593')
INSERT INTO DoctorList VALUES ('384662','2238475847')
INSERT INTO DoctorList VALUES ('384663','1238294735')
INSERT INTO DoctorList VALUES ('384664','4382957364')
INSERT INTO DoctorList VALUES ('384665','3235146345')
INSERT INTO DoctorList VALUES ('384666','4253464654')
INSERT INTO DoctorList VALUES ('384667','3423524643')
INSERT INTO DoctorList VALUES ('384668','8789472391')
INSERT INTO DoctorList VALUES ('384669','5903550285')
INSERT INTO DoctorList VALUES ('384670','1038395839')


INSERT INTO Accident VALUES ('88233','384667','Y','Left thumb has been injuried while working.','Adward Steel Plant','7261726')
INSERT INTO Accident VALUES ('88237','384662','Y','Bruised left arm while working.','Hudson brewery Co.,Ltd.','3483748')


INSERT INTO MedicationDetails VALUES ('109451','2 tablets/day','Aspirin','Acetaminophen')
INSERT INTO MedicationDetails VALUES ('109452','1 tablet/day','TYLENOL® Regular Strength Tablets','Muscle relaxants')
INSERT INTO MedicationDetails VALUES ('109453','2 caplets/day','TYLENOL® 8 HR Extended-Release Caplets','Anti-anxiety drugs')
INSERT INTO MedicationDetails VALUES ('109454','1 tablet/day','Xanax (alprazolam) tablet','Opioids')
INSERT INTO MedicationDetails VALUES ('109455','3 tablets/day','Betamethasone','Corticosteroids')
INSERT INTO MedicationDetails VALUES ('109456','1 caplet/day','TYLENOL® 8 HR Extended-Release Caplets','Corticosteroids')
INSERT INTO MedicationDetails VALUES ('109457','1 injection/day','Morphine','Anti-anxiety drugs')
INSERT INTO MedicationDetails VALUES ('109458','5 tablets/day','Betamethasone','Nonsteroidal anti-inflammatory drugs (NSAIDs)')
INSERT INTO MedicationDetails VALUES ('109459','2 tablets/day','Xanax (alprazolam) tablet','Muscle relaxants')
INSERT INTO MedicationDetails VALUES ('109460','2 caplets/day','TYLENOL® 8 HR Extended-Release Caplets','Muscle relaxants')


INSERT INTO Prescription VALUES ('384661','109458')
INSERT INTO Prescription VALUES ('384662','109451')
INSERT INTO Prescription VALUES ('384663','109459')
INSERT INTO Prescription VALUES ('384664','109457')
INSERT INTO Prescription VALUES ('384665','109456')
INSERT INTO Prescription VALUES ('384666','109460')
INSERT INTO Prescription VALUES ('384667','109454')
INSERT INTO Prescription VALUES ('384668','109455')
INSERT INTO Prescription VALUES ('384669','109453')
INSERT INTO Prescription VALUES ('384670','109452')


INSERT INTO ProcedureCost VALUES ('28308','109451','$300','Medication')
INSERT INTO ProcedureCost VALUES ('28309','109456','$500','Medication')
INSERT INTO ProcedureCost VALUES ('28310','109454','$1000','Medication')
INSERT INTO ProcedureCost VALUES ('28311','109458','$1500','Medication')
INSERT INTO ProcedureCost VALUES ('28312','109460','$2500','Medication')
INSERT INTO ProcedureCost VALUES ('28313','109452','$650','Medication')
INSERT INTO ProcedureCost VALUES ('28314','109453','$70','Medication')
INSERT INTO ProcedureCost VALUES ('28315','109457','$800','Medication')
INSERT INTO ProcedureCost VALUES ('28316','109455','$4600','Medication')
INSERT INTO ProcedureCost VALUES ('28317','109459','$800','Medication')


INSERT INTO VitalSet VALUES ('19834','384664','79','15','80','2016-01-02 12:14:55')
INSERT INTO VitalSet VALUES ('19835','384665','90','16','120','2014-07-11 09:22:08')
INSERT INTO VitalSet VALUES ('19836','384661','93','20','90','2012-08-22 15:27:13')
INSERT INTO VitalSet VALUES ('19837','384668','101','24','100','2015-09-30 06:55:06')
INSERT INTO VitalSet VALUES ('19838','384666','95','17','90','2016-04-28 08:45:18')
INSERT INTO VitalSet VALUES ('19839','384669','77','30','80','2013-06-16 11:37:37')
INSERT INTO VitalSet VALUES ('19840','384663','87','28','110','2012-12-28 18:26:25')
INSERT INTO VitalSet VALUES ('19841','384662','65','16','140','2015-11-21 23:15:43')
INSERT INTO VitalSet VALUES ('19842','384670','77','18','160','2013-05-31 13:09:23')
INSERT INTO VitalSet VALUES ('19843','384667','80','22','120','2016-03-23 15:27:43')


INSERT INTO TestStandard VALUES ('937761','Blood Test','WBC','4.0','11.0','K/MM3')
INSERT INTO TestStandard VALUES ('937762','Blood Test','RBC','4.20','5.40','M/MM3')
INSERT INTO TestStandard VALUES ('937763','Blood Test','HGB','12.0','16.0','GM/DL')
INSERT INTO TestStandard VALUES ('937764','Blood Test','HCT','37.0','47.0','%')
INSERT INTO TestStandard VALUES ('937765','Blood Test','MCV','80.0','100.0','FL')
INSERT INTO TestStandard VALUES ('937766','Blood Test','MCH','27.0','34.0','PG')
INSERT INTO TestStandard VALUES ('937767','Blood Test','MCHC','33.0','37.0','%')
INSERT INTO TestStandard VALUES ('937768','Analysis of Urine','WBC','0','2','HPF')
INSERT INTO TestStandard VALUES ('937769','Analysis of Urine','RBC','0','3','HPF')
INSERT INTO TestStandard VALUES ('937770','Skin Test for Allergy','PPD','100','180','ul')



INSERT INTO TestDetails VALUES ('037221','384669','937761','Blood Test-WBC','5.0','Normal')
INSERT INTO TestDetails VALUES ('037222','384669','937762','Blood Test-RBC','3,70','Low')
INSERT INTO TestDetails VALUES ('037223','384669','937763','Blood Test-HGB','13.0','Normal')
INSERT INTO TestDetails VALUES ('037224','384661','937761','Blood Test-WBC','16.0','High')
INSERT INTO TestDetails VALUES ('037225','384661','937762','Blood Test-RBC','4.50','Normal')
INSERT INTO TestDetails VALUES ('037226','384661','937763','Blood Test-HGB','11.0','Low')
INSERT INTO TestDetails VALUES ('037227','384661','937764','Blood Test-HCT','40.0','Normal')
INSERT INTO TestDetails VALUES ('037228','384665','937769','Analysis of Urine-WBC','5','High')


INSERT INTO TestImage VALUES ('21051','037221','WBC Picture','jpg','11.1','MB','https://healthcare.org/Health023809.jpg')
INSERT INTO TestImage VALUES ('21052','037222','RBC Picture','jpg','4.2','MB','https://healthcare.org/dsfsd/Healthcare24324.jpg')
INSERT INTO TestImage VALUES ('21053','037228','Urine Picture','png','8.6','MB','https://healthcare.org/Healthcare4394052.png')
INSERT INTO TestImage VALUES ('21054','037223','HGB Picture','jpg','1','GB','https://healthcare.org/Healthcareewtw34534.jpg')




