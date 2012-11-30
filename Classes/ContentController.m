//
//  ContentController.m
//  mmwrMockup
//
//
//  Copyright 2011  U.S. Centers for Disease Control and Prevention
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software 
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ContentController.h"
#import "CdcArticle.h"
#import "CdcPublication.h"

@implementation ContentController


@synthesize library;
@synthesize currIssue, currPublication, currArticle;

- (id)init {

	CdcPublication *pub;
	CdcArticle *article;
	CdcIssue *issue;
	
	// create CDC library with NSDictionary
	self.library = [[NSMutableArray alloc] init];
	
	// create static content for all CDC publications
	
	// create Vital Signs content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:VITAL_SIGNS type:REPORT];
	pub.contentTypes = PDF;
    
    // create issue of Vital Signs
	issue = [[CdcIssue alloc] initWithIssueId:@"July, 2007"];
	article = [[CdcArticle alloc] initWithTitle:@"July 2007, Cancer Screening"];
	article.teaser = @"Most adults are getting recommended breast and colorectal cancer screenings. Yet a new CDC report says more than 22 million adults have not had screening tests for colorectal cancer, and more than 7 million women have not had a recent mammogram to screen for breast cancer as recommended.";
	article.validContentTypes = PDF;
	article.pdfFile = @"2010-07-vitalsigns";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];

	[self.library addObject:pub];
	[pub release];

	// create MMWR content and add to library 
	pub = [[CdcPublication alloc] initWithPubIdAndType:WEEKLY_REPORT type:MAGAZINE];
	
	// create issue of MMWR
	issue = [[CdcIssue alloc] initWithIssueId:@"July 23, 2010, Vol 59, No 28"];

    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Emergence of Cryptococcus gattii --- Pacific Northwest, 2004--2010"];
	article.teaser = @"Cryptococcus is a genus of fungi, of which two species, Cryptococcus neoformans and Cryptococcus gattii, cause nearly all human and animal cryptococcal infections.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5928a1.htm?s_cid=mm5928a1_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"La Crosse Virus Neuroinvasive Disease --- Missouri, 2009"];
	article.teaser = @"La Crosse virus (LACV), a California serogroup bunyavirus, is a leading cause of pediatric arboviral encephalitis in the United States and is transmitted primarily by the eastern treehole mosquito (Aedes triseriatus) (1).";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5928a2.htm?s_cid=mm5928a2_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Gastrointestinal Anthrax after an Animal-Hide Drumming Event --- New Hampshire and Massachusetts, 2009"];
	article.teaser = @"On December 24, 2009, a woman aged 24 years from New Hampshire was confirmed to have gastrointestinal anthrax on the basis of clinical findings and a Bacillus anthracis blood culture isolate.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5928a3.htm?s_cid=mm5928a3_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notes from the Field: Dengue Epidemic --- Puerto Rico, January--July 2010"];
	article.teaser = @"During January 1--July 15, 2010, a total of 6,321 suspected dengue cases were reported to the Puerto Rico Department of Health (PRDH) and CDC's Dengue Branch Passive Dengue Surveillance System, compared with 2,711 cases reported during the same period in 2009.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5928a4.htm?s_cid=mm5928a4_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"QuickStats: Use of Selected Contraceptive Methods by Married Women of Childbearing Age in the United States, 2006--2008, Compared with Married Women in Selected Countries with Low Fertility Rates, 2000--2008"];
	article.teaser = @"The included figure shows the use of selected contraceptive methods by married women of childbearing age in the United States, 2006-2008, compared with married women in selected countries with low fertility rates from 2000-2008.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5928a5.htm?s_cid=mm5928a5_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notifiable Diseases and Mortality Tables"];
	article.teaser = @"Table I, Summary of provisional cases of selected notifiable diseases, United States, cumulative, week ending July 17, 2010. Figure I, Selected notifiable disease reports, United States, comparison of provisional 4-week totals ending July 17, 2010, with historical data.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5928md.htm?s_cid=mm5928md_w";
	[issue addArticle:article];
	[article release];
    
    // add issue to current pub 
	[pub addIssue:issue];
	[issue release];
    
	// create issue of MMWR
	issue = [[CdcIssue alloc] initWithIssueId:@"July 16, 2010, Vol 59, No 27"];

    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Television and Video Viewing Time Among Children Aged 2 Years --- Oregon, 2006--2007"];
	article.teaser = @"Excessive exposure of children to television and videos (viewing time) is associated with impaired childhood development (1) and childhood obesity (2).";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5927a1.htm?s_cid=mm5927a1_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Commercial Fishing Deaths --- United States, 2000--2009"];
	article.teaser = @"Commercial fishing is one of the most dangerous occupations in the United States (1). During 1992--2008, an annual average of 58 reported deaths occurred (128 deaths per 100,000 workers) (1), compared with an average of 5,894 deaths (four per 100,000 workers) among all U.S. workers.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5927a2.htm?s_cid=mm5927a2_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notes from the Field: Outbreak of Acute Lead Poisoning Among Children Aged <5 Years --- Zamfara, Nigeria, 2010"];
	article.teaser = @"On May 8, 2010, the Nigerian Federal Ministry of Health assembled federal, state, and international organizations to investigate reports of death from lead poisoning in at least six villages in Zamfara, Nigeria.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5927a3.htm?s_cid=mm5927a3_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notifiable Diseases and Mortality Tables"];
	article.teaser = @"Table I, Summary of provisional cases of selected notifiable diseases, United States, cumulative, week ending July 10, 2010. Figure I, Selected notifiable disease reports, United States, comparison of provisional 4-week totals ending July 10, 2010, with historical data.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5927md.htm?s_cid=mm5927md_w";
	[issue addArticle:article];
	[article release];
    
    // add issue to current pub 
	[pub addIssue:issue];
	[issue release];
    
    // create issue of MMWR
	issue = [[CdcIssue alloc] initWithIssueId:@"July 9, 2010, Vol 59, No 26"];

    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Cigarette Use Among High School Students --- United States, 1991--2009"];
	article.teaser = @"Understanding the trends in the prevalence of cigarette smoking among youths enables policy makers to target prevention resources more effectively. Every 2 years, CDC analyzes data from the national Youth Risk Behavior Survey (YRBS) to evaluate trends in cigarette use among high school students in the United States.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a1.htm?s_cid=mm5926a1_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Progress Toward Poliomyelitis Eradication --- Nigeria, January 2009--June 2010"];
	article.teaser = @"Nigeria has maintained a high incidence of wild poliovirus (WPV) cases attributed to persistently high proportions of under- and unimmunized children, and, for many years, the country has served as a reservoir for substantial international spread (1).";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a2.htm?s_cid=mm5926a2_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Vital Signs: Colorectal Cancer Screening Among Adults Aged 50--75 Years --- United States, 2008"];
	article.teaser = @"Colorectal cancer (CRC) remains the second leading cause of cancer deaths in the United States and the leading cause of cancer deaths among nonsmokers.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a3.htm?s_cid=mm5926a3_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Vital Signs: Breast Cancer Screening Among Women Aged 50--74 Years --- United States, 2008"];
	article.teaser = @"Breast cancer remains the second leading cause of cancer deaths for women in the United States. Screening with treatment has lowered breast cancer mortality.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a4.htm?s_cid=mm5926a4_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notes from the Field: Pertussis --- California, January--June 2010"];
	article.teaser = @"The number of pertussis cases reported to the California Department of Public Health (CDPH) has increased substantially during 2010. The increase in cases was first noted in late March among patients admitted to a children's hospital.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a5.htm?s_cid=mm5926a5_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notes from the Field: Salmonella Newport Infections Associated with Consumption of Unpasteurized Milk --- Utah, April--June 2010"];
	article.teaser = @"On April 29, 2010, the Utah Department of Health (UDOH) was notified of three cases of Salmonella enterica serotype Newport infection. The three patients recently had consumed unpasteurized milk purchased from a store in northern Utah (store A).";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a6.htm?s_cid=mm5926a6_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Announcement: MMWR on Facebook and Twitter"];
	article.teaser = @"MMWR reports now can be accessed on social networking websites Facebook and Twitter.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a7.htm?s_cid=mm5926a7_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"QuickStats: Never-Married Females and Males Aged 15--19 Years Who Have Ever Had Sexual Intercourse --- National Survey of Family Growth, United States, 1988--2008"];
	article.teaser = @"The included figure shows never-married females and males aged 15-19 years who have ever had sexual intercourse in the United States from 1988-2008.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926a8.htm?s_cid=mm5926a8_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notifiable Diseases and Mortality Tables"];
	article.teaser = @"Table I, Summary of provisional cases of selected notifiable diseases, United States, cumulative, week ending July 3, 2010 (26th Week). Figure I, Selected notifiable disease reports, United States, comparison of provisional 4-week totals ending July 3, 2010, with historical data.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5926md.htm?s_cid=mm5926md_w";
	[issue addArticle:article];
	[article release];
    
    // add issue to current pub 
	[pub addIssue:issue];
	[issue release];
    
	// create issue of MMWR
	issue = [[CdcIssue alloc] initWithIssueId:@"July 2, 2010,  Vol 59, No 25"];

    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"West Nile Virus Activity --- United States, 2009"];
	article.teaser = @"West Nile virus (WNV) was first detected in the Western Hemisphere in 1999 in New York City and has since caused seasonal epidemics of febrile illness and neurologic disease across the United States, where it is now the leading cause of arboviral encephalitis (1). This report updates a previous report (2) and summarizes WNV activity in the United States reported to CDC in 2009. ";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925a1.htm?s_cid=mm5925a1_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Vaccinia Virus Infection After Sexual Contact with a Military Smallpox Vaccinee --- Washington, 2010"];
	article.teaser = @"On March 1, 2010, the Washington State Department of Health (WADOH) notified Public Health -- Seattle & King County (PHSKC) of a suspected case of contact transmission of vaccinia virus from sexual contact with a member of the military who had been vaccinated against smallpox.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925a2.htm?s_cid=mm5925a2_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Hepatitis A Vaccination Coverage Among U.S. Children Aged 12--23 Months --- Immunization Information System Sentinel Sites, 2006--2009"];
	article.teaser = @"Hepatitis A vaccine was first licensed as a 2-dose vaccine for children aged ≥24 months in 1995. In 1996 and 1999, the Advisory Committee on Immunization Practices (ACIP) recommended routine hepatitis A vaccination for children aged ≥24 months in communities with the highest rates of the disease (1,2).";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925a3.htm?s_cid=mm5925a3_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Announcements: Immunization Update 2010 Webcast"];
	article.teaser = @"CDC will present ""Immunization Update 2010"" via satellite broadcast and webcast on August 5, 2010. The presentation is expected to focus on current use of influenza, pneumococcal conjugate, human papillomavirus, and meningococcal vaccines.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925a4.htm?s_cid=mm5925a4_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Announcements: Countermeasures Injury Compensation Program"];
	article.teaser = @"The Countermeasures Injury Compensation Program (CICP) is a federal program that provides compensation for unreimbursed medical expenses, lost employment income, and/or death benefits for certain persons.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925a5.htm?s_cid=mm5925a5_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"QuickStats: Primary Contraceptive Method Used Among Women Aged 15--44 Years --- National Survey of Family Growth, United States, 2006--2008"];
	article.teaser = @"Women were asked to report up to four contraceptive methods they used during the month of interview. If a woman reported using multiple contraceptive methods during the month of interview, the most effective method was considered her primary method.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925a6.htm?s_cid=mm5925a6_w";
	[issue addArticle:article];
	[article release];
    
    // create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"Notifiable Diseases and Mortality Tables"];
	article.teaser = @"Table I, Summary of provisional cases of selected notifiable diseases, United States, cumulative, week ending June 26, 2010 (25th Week).\nFigure I, Selected notifiable disease reports, United States, comparison of provisional 4-week totals ending June 26, 2010, with historical data.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5925md.htm?s_cid=mm5925md_w";
	[issue addArticle:article];
	[article release];
    
    // add issue to current pub 
	[pub addIssue:issue];
	[issue release];
    
    // create issue of MMWR
	issue = [[CdcIssue alloc] initWithIssueId:@"June 25, 2010, Vol 59, No 24"];

	// create all articles and add to current issue
	article = [[CdcArticle alloc] initWithTitle:@"National HIV Testing Day --- June 27, 2010"];
	article.teaser = @"National HIV Testing Day is observed each year on June 27 to promote testing for and diagnosis of human immunodeficiency virus (HIV) infection. Persons who learn they are infected with HIV can receive appropriate health care, treatment, monitoring, and prevention services, and can survive longer.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a1.htm?s_cid=mm5924a1_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Expanded HIV Testing and Trends in Diagnoses of HIV Infection --- District of Columbia, 2004--2008"]; 
	article.teaser = @"In the District of Columbia (DC), the human immunodeficiency virus (HIV) case rate is nearly 10 times the U.S. rate and higher than comparable U.S. cities, such as Baltimore, Philadelphia, New York City, Detroit, and Chicago (1,2).";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a2.htm?s_cid=mm5924a2_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Routine Jail-Based HIV Testing --- Rhode Island, 2000--2007"];
	article.teaser = @"The prevalence of human immunodeficiency virus (HIV) infection among incarcerated persons in the United States (1.5%) is approximately four times greater than the prevalence among persons in community settings (0.4%) (1).";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a3.htm?s_cid=mm5924a3_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Sodium Intake Among Adults --- United States, 2005−2006"];
	article.teaser = @"Excessive dietary sodium consumption increases blood pressure, which increases the risk for stroke, coronary heart disease, heart failure, and renal disease (1). ";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a4.htm?s_cid=mm5924a4_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Detection of Enterobacteriaceae Isolates Carrying Metallo-Beta-Lactamase --- United States, 2010"];
	article.teaser = @"uring January--June 2010, three Enterobacteriaceae isolates carrying a newly described resistance mechanism, the New Delhi metallo-beta-lactamase (NDM-1) (1), were identified from three U.S. states at the CDC antimicrobial susceptibility laboratory.";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a5.htm?s_cid=mm5924a5_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Notice to Readers: Limitations Inherent to a Cross-Sectional Assessment of Blood Lead Levels Among Persons Living in Homes with High Levels of Lead in Drinking Water"];
	article.teaser = @"During 2000--2003, the District of Columbia (DC) experienced very high concentrations of lead in drinking water. In February 2004, the DC Department of Health requested assistance from CDC to assess health effects of elevated lead levels in residential tap water.";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a6.htm?s_cid=mm5924a6_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"QuickStats: Death Rates For Leading Causes* Among Youths Aged 12--19 Years --- National Vital Statistics System, United States, 1999--2006"];
	article.teaser = @"The included figure shows death rates for leading causes among youths aged 12-19 years in the United States from 1999-2006.";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924a7.htm?s_cid=mm5924a7_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Notifiable Diseases and Mortality Tables "];
	article.teaser = @"Table I, Summary of provisional cases of selected notifiable diseases, United States, cumulative, week ending June 19, 2010 (24th Week).\nFigure I, Selected notifiable disease reports, United States, comparison of provisional 4-week totals ending June 19, 2010, with historical data.";
	article.validContentTypes = HTML; 
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5924md.htm?s_cid=mm5924md_w";
	[issue addArticle:article];
	[article release];

	// add issue to current pub 
	[pub addIssue:issue];
	[issue release];
	
	issue = [[CdcIssue alloc] initWithIssueId:@"June 18, 2010, Vol 59, No 23"];

	article = [[CdcArticle alloc] initWithTitle:@"Emergency Department Visits Involving Nonmedical Use of Selected Prescription Drugs --- United States, 2004--2008"];
	article.teaser = @"Rates of overdose deaths involving prescription drugs increased rapidly in the United States during 1999--2006 (1). However, such mortality data do not portray the morbidity associated with prescription drug overdoses. ";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5923a1.htm?s_cid=mm5923a1_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Perceived Health Needs and Receipt of Services During Pregnancy --- Oklahoma and South Carolina, 2004--2007"];
	article.teaser = @"Prenatal care visits present an opportunity for health-care providers to offer services recommended by professional societies and educate women regarding behaviors and exposures that might affect their pregnancies.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5923a2.htm?s_cid=mm5923a2_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Travel-Associated Dengue Surveillance --- United States, 2006--2008"];
	article.teaser = @"Dengue is caused by four antigenically related viruses (DENV-1, DENV-2, DENV-3, and DENV-4). Dengue fever is endemic in most tropical and subtropical areas of the world, and in 2007 nearly 1 million cases were reported in the Americas alone.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5923a3.htm?s_cid=mm5923a3_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Errata: Vol. 59, No. SS-2"];
	article.teaser = @"In the Surveillance Summary, ""Surveillance for Human West Nile Virus Disease --- United States, 1999--2008,"" the values in the legend for Figure 6 on page 12 were incorrect. The figure legend should read as follows (from darkest to lightest shading): ≥2.00, 1.50--1.99, 1.00--1.49, 0.50--0.99, 0.01--0.49, and 0.00.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5923a4.htm?s_cid=mm5923a4_w";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Notifiable Diseases and Mortality Tables"];
	article.teaser = @"Table I, Summary of provisional cases of selected notifiable diseases, United States, cumulative, week ending June 12, 2010 (23rd Week). Figure I, Selected notifiable disease reports, United States, comparison of provisional 4-week totals ending June 12, 2010, with historical data.";
	article.validContentTypes = HTML;
	article.url = @"http://www.cdc.gov/mmwr/preview/mmwrhtml/mm5923md.htm?s_cid=mm5923md_w";
	[issue addArticle:article];
	[article release];
	
	// add issue to current pub 
	[pub addIssue:issue];
	[issue release];
	[self.library addObject:pub];
	[pub release];
    
    // create Recommendations and Reports content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:RECOMMENDATIONS_AND_REPORTS type:REPORT];
	pub.contentTypes = PDF;
    
    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"July 23, 2010, Vol 59, No RR--6"];
	article = [[CdcArticle alloc] initWithTitle:@"Use of Anthrax Vaccine in the United States: Recommendations of the Advisory Committee on Immunization Practices (ACIP), 2009"];
	article.teaser = @"Use of Anthrax Vaccine in the United States: Recommendations of the Advisory Committee on Immunization Practices (ACIP), 2009 ";
	article.validContentTypes = PDF;
	article.pdfFile = @"rr5906";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"June 25, 2010, Vol 59, No RR--5"];
	article = [[CdcArticle alloc] initWithTitle:@"Updated Guidelines for Using Interferon Gamma Release Assays to Detect Mycobacterium tuberculosis Infection — United States, 2010"];
	article.teaser = @"Updated Guidelines for Using Interferon Gamma Release Assays to Detect Mycobacterium tuberculosis Infection — United States, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"rr5905";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];

    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"June 18, 2010, Vol 59, No RR--4"];
	article = [[CdcArticle alloc] initWithTitle:@"U.S. Medical Eligibility Criteria for Contraceptive Use, 2010 — Adapted from the World Health Organization Medical Eligibility Criteria for Contraceptive Use, 4th edition"];
	article.teaser = @"U.S. Medical Eligibility Criteria for Contraceptive Use, 2010 — Adapted from the World Health Organization Medical Eligibility Criteria for Contraceptive Use, 4th edition";
	article.validContentTypes = PDF;
	article.pdfFile = @"rr5904";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"May 7, 2010, Vol 59, No RR--3"];
	article = [[CdcArticle alloc] initWithTitle:@"Use of Combination Measles, Mumps, Rubella, and Varicella Vaccine — Recommendations of the Advisory Committee on Immunization Practices"];
	article.teaser = @"Use of Combination Measles, Mumps, Rubella, and Varicella Vaccine — Recommendations of the Advisory Committee on Immunization Practices";
	article.validContentTypes = PDF;
	article.pdfFile = @"rr5903";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"March 19, 2010, Vol 59, No RR--2"];
	article = [[CdcArticle alloc] initWithTitle:@"Use of a Reduced (4-Dose) Vaccine Schedule for Postexposure Prophylaxis to Prevent Human Rabies --- Recommendations of the Advisory Committee on Immunization Practices"];
	article.teaser = @"Use of a Reduced (4-Dose) Vaccine Schedule for Postexposure Prophylaxis to Prevent Human Rabies --- Recommendations of the Advisory Committee on Immunization Practices";
	article.validContentTypes = PDF;
	article.pdfFile = @"rr5902";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"March 12, 2010, Vol 59, No RR--1"];
	article = [[CdcArticle alloc] initWithTitle:@"Japanese Encephalitis Vaccines --- Recommendations of the Advisory Committee on Immunization Practices (ACIP) "];
	article.teaser = @"Japanese Encephalitis Vaccines --- Recommendations of the Advisory Committee on Immunization Practices (ACIP) ";
	article.validContentTypes = PDF;
	article.pdfFile = @"rr5901";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
    
	[self.library addObject:pub];
	[pub release];
    
    // create Recommendations and Reports content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:SURVEILLANCE_SUMMARIES type:REPORT];
	pub.contentTypes = PDF;
    
    // create issue of Recommendations and Reports
	issue = [[CdcIssue alloc] initWithIssueId:@"June 25, 2010, Vol 59, No SS--7"];
	article = [[CdcArticle alloc] initWithTitle:@"Malaria Surveillance — United States, 2008"];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"ss5907";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
	issue = [[CdcIssue alloc] initWithIssueId:@"June 11, 2010, Vol 59, No SS--6"];
	article = [[CdcArticle alloc] initWithTitle:@"Cryptosporidiosis Surveillance — United States, 2006--2008 and Giardiasis Surveillance — United States, 2006--2008"];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"ss5906";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
	issue = [[CdcIssue alloc] initWithIssueId:@"June 4, 2010, Vol 59, No SS--5"];
	article = [[CdcArticle alloc] initWithTitle:@"Youth Risk Behavior Surveillance — United States, 2009 "];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
	issue = [[CdcIssue alloc] initWithIssueId:@"May 14, 2010, Vol 59, No SS--4"];
	article = [[CdcArticle alloc] initWithTitle:@"Surveillance for Violent Deaths — National Violent Death Reporting System, 16 States, 2007"];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
	issue = [[CdcIssue alloc] initWithIssueId:@"April 16, 2010, Vol 59, No SS--3"];
	article = [[CdcArticle alloc] initWithTitle:@"Adult Tobacco Survey — 19 States, 2003–2007"];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
	issue = [[CdcIssue alloc] initWithIssueId:@"April 2, 2010, Vol 59, No SS--2"];
	article = [[CdcArticle alloc] initWithTitle:@"Surveillance for Human West Nile Virus Disease — United States, 1999–2008"];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
	issue = [[CdcIssue alloc] initWithIssueId:@"February 5, 2010, Vol 59, No SS--1"];
	article = [[CdcArticle alloc] initWithTitle:@"Surveillance of Certain Health Behaviors and Conditions Among States and Selected Local Areas — Behavioral Risk Factor Surveillance System, United States, 2007"];
	article.teaser = @"";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
	[pub addIssue:issue];
	[issue release];
    
    [self.library addObject:pub];
	[pub release];
    
    // create Notifiable Diseases content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:NOTIFIABLE_DISEASES type:REPORT];
	pub.contentTypes = PDF;
    
	issue = [[CdcIssue alloc] initWithIssueId:@"United States, 2008"];
	article = [[CdcArticle alloc] initWithTitle:@"Summary of Notifiable Diseases, United States, 2008"];
	article.teaser = @"Preface"
    ", Background"
    ", Infectious Diseases Designated as Notifiable at the National Level during 2008"
    ", Data Sources"
    ", Interpreting Data"
    ", Transition in NNDSS Data Collection and Reporting"
    ", Methodology for Identifying which Nationally Notifiable Infectious Diseases are Reportable"
    ", Revised International Health Regulations"
    ", Highlights for 2008"
    ", Summaries of Notifiable Diseases in the United States, 2008"
    ", Graphs and Maps for Selected Notifiable Diseases in the United States, 2008"
    ", Historical Summaries of Notifiable Diseases in the United States, 1977–2008"
    ", Selected Reading";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
    [pub addIssue:issue];
	[issue release];

	issue = [[CdcIssue alloc] initWithIssueId:@"United States, 2007"];
	article = [[CdcArticle alloc] initWithTitle:@"Summary of Notifiable Diseases, United States, 2007"];
	article.teaser = @"Preface"
    ", Background"
    ", Infectious Diseases Designated as Notifiable at the National Level during 2007"
    ", Data Sources"
    ", Interpreting Data"
    ", Transition in NNDSS Data Collection and Reporting"
    ", Change in Methodology for Identifying which Nationally Notifiable Infectious Diseases were Not Reportable in Nationally Notifiable Disease Surveillance System (NNDSS) Reporting Jurisdictions in 2007"
    ", Revised International Health Regulations"
    ", Highlights for 2007"
    ", Summaries of Notifiable Diseases in the United States, 2007"
    ", Graphs and Maps for Selected Notifiable Diseases in the United States, 2007"
    ", Historical Summaries of Notifiable Diseases in the United States, 1976–2007"
    ", Selected Reading";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
    [pub addIssue:issue];
	[issue release];
	
	issue = [[CdcIssue alloc] initWithIssueId:@"United States, 2006"];
	article = [[CdcArticle alloc] initWithTitle:@"Summary of Notifiable Diseases, United States, 2006"];
	article.teaser = @"Preface"
    ", Background"
    ", Revised International Health Regulations"
    ", Infectious Diseases Designated as Notifiable at the National Level during 2006"
    ", Data Sources"
    ", Interpreting Data"
    ", Transition in NNDSS Data Collection and Reporting"
    ", Highlights"
    ", Summaries of Notifiable Diseases in the United States, 2006"
    ", Graphs and Maps for Selected Notifiable Diseases in the United States, 2006"
    ", Historical Summaries of Notifiable Diseases in the United States, 1975–2006"
    ", Selected Reading";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
    [pub addIssue:issue];
	[issue release];
	
	issue = [[CdcIssue alloc] initWithIssueId:@"United States, 2005"];
	article = [[CdcArticle alloc] initWithTitle:@"Summary of Notifiable Diseases, United States, 2005"];
	article.teaser = @"Preface"
    ", Background"
    ", Infectious Diseases Designated as Notifiable at the National Level during 2005"
    ", Data Sources"
    ", Interpreting Data"
    ", Transition in NNDSS Data Collection and Reporting"
    ", Highlights"
    ", Summaries of Notifiable Diseases in the United States, 2005"
    ", Graphs and Maps for Selected Notifiable Diseases in the United States, 2005"
    ", Selected Reading";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
    [pub addIssue:issue];
	[issue release];
	
	issue = [[CdcIssue alloc] initWithIssueId:@"United States, 2004"];
	article = [[CdcArticle alloc] initWithTitle:@"Summary of Notifiable Diseases, United States, 2004"];
	article.teaser = @"Preface"
    ", Background"
    ", Infectious Diseases Designated as Notifiable at the National Level during 2004"
    ", Data Sources"
    ", Interpreting Data"
    ", Transition in NNDSS Data Collection and Reporting"
    ", Highlights"
    ", Summaries of Notifiable Diseases in the United States, 2004"
    ", Graphs and Maps for Selected Notifiable Diseases in the United States, 2004"
    ", Selected Reading";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
    [pub addIssue:issue];
	[issue release];
	
	issue = [[CdcIssue alloc] initWithIssueId:@"United States, 2003"];
	article = [[CdcArticle alloc] initWithTitle:@"Summary of Notifiable Diseases, United States, 2003"];
	article.teaser = @"Preface"
    ", Background"
    ", Data Sources"
    ", Interpreting Data"
    ", Highlights"
    ", Summaries of Notifiable Diseases in the United States, 2003"
    ", Graphs and Maps for Selected Notifiable Diseases in the United States, 2003"
    ", Historical Summaries of Notifiable Diseases in the United States, 1972--2003"
    ", Selected Reading";
	article.validContentTypes = PDF;
	article.pdfFile = @"demopage";
	[issue addArticle:article];
	[article release];
    [pub addIssue:issue];
	[issue release];
	
    [self.library addObject:pub];
	[pub release];
    
    // create Podcasts content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:PODCASTS type:PODCAST];
	pub.contentTypes = HTML|PDF;
    
	issue = [[CdcIssue alloc] initWithIssueId:@"Turn Off the TV"];
	article = [[CdcArticle alloc] initWithTitle:@"Turn Off the TV, A Minute of Health with CDC, Podcast (0:59)"];
	article.teaser = @"Television and Video Viewing Time Among Children Aged 2 Years\n"
	"Oregon, 2006–2007, Recorded: July 20, 2010; Posted: July 22, 2010";
	article.validContentTypes = AUDIO;
	article.url = @"http://www2c.cdc.gov/podcasts/media/mp3/mmwr1_072210.mp3";
	[issue addArticle:article];
	[article release];

	article = [[CdcArticle alloc] initWithTitle:@"Turn Off the TV, A Minute of Health with CDC, Transcript"];
	article.teaser = @"Television and Video Viewing Time Among Children Aged 2 Years\n"
	"Oregon, 2006–2007, Recorded: July 20, 2010; Posted: July 22, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"mmwr1_072210_transcript";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Turn Off the TV, A Cup of Health with CDC, Podcast (7:42)"];
	article.teaser = @"Television and Video Viewing Time Among Children Aged 2 Years\n"
	"Oregon, 2006–2007, Recorded: July 20, 2010; Posted: July 22, 2010";
	article.validContentTypes = AUDIO;
	article.url = @"http://www2c.cdc.gov/podcasts/media/mp3/mmwr5_072210.mp3";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Turn Off the TV, A Cup of Health with CDC, Transcript"];
	article.teaser = @"Television and Video Viewing Time Among Children Aged 2 Years\n"
	"Oregon, 2006–2007, Recorded: July 20, 2010; Posted: July 22, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"mmwr5_072210_transcript";
	[issue addArticle:article];
	[article release];
	
    [pub addIssue:issue];
	[issue release];
	
	issue = [[CdcIssue alloc] initWithIssueId:@"Get Your Hep A Vaccine"];
	article = [[CdcArticle alloc] initWithTitle:@"Get Your Hep A Vaccine, A Minute of Health with CDC, Podcast (0:59)"];
	article.teaser = @"Hepatitis A Vaccination Coverage Among Children Aged 12–23 Years\n"
	"United States, 2006–2009, Recorded: July 6, 2010; posted: July 15, 2010";
	article.validContentTypes = AUDIO;
	article.url = @"http://www2c.cdc.gov/podcasts/media/mp3/mmwr1_071510.mp3";
	[issue addArticle:article];
	[article release];

	article = [[CdcArticle alloc] initWithTitle:@"Get Your Hep A Vaccine, A Minute of Health with CDC, Transcript"];
	article.teaser = @"Hepatitis A Vaccination Coverage Among Children Aged 12–23 Years\n"
	"United States, 2006–2009, Recorded: July 6, 2010; posted: July 15, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"mmwr1_071510_transcript";
	[issue addArticle:article];
	[article release];

	article = [[CdcArticle alloc] initWithTitle:@"Get Your Hep A Vaccine, A Cup of Health with CDC, Podcast (4:45)"];
	article.teaser = @"Hepatitis A Vaccination Coverage Among Children Aged 12–23 Years\n"
	"United States, 2006–2009, Recorded: July 6, 2010; posted: July 15, 2010";
	article.validContentTypes = AUDIO;
	article.url = @"http://www2c.cdc.gov/podcasts/media/mp3/mmwr5_071510.mp3";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Get Your Hep A Vaccine, A Cup of Health with CDC, Transcript"];
	article.teaser = @"Hepatitis A Vaccination Coverage Among Children Aged 12–23 Years\n"
	"United States, 2006–2009, Recorded: July 6, 2010; posted: July 15, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"mmwr5_071510_transcript";
	[issue addArticle:article];
	[article release];
	
    [pub addIssue:issue];
	[issue release];
	
	
	issue = [[CdcIssue alloc] initWithIssueId:@"Mosquito Alert"];
	article = [[CdcArticle alloc] initWithTitle:@"Mosquito Alert, A Minute of Health with CDC, Podcast (0:59)"];
	article.teaser = @"West Nile Virus Activity — United States, January 1–December 31, 2009, Recorded: June 29, 2010; posted: July 8, 2010";
	article.validContentTypes = AUDIO;
	article.url = @"http://www2c.cdc.gov/podcasts/media/mp3/mmwr1_070810.mp3";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Mosquito Alert, A Minute of Health with CDC, Transcript"];
	article.teaser = @"West Nile Virus Activity — United States, January 1–December 31, 2009, Recorded: June 29, 2010; posted: July 8, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"mmwr1_070810_transcript";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Mosquito Alert, A Cup of Health with CDC, Podcast (4:45)"];
	article.teaser = @"West Nile Virus Activity — United States, January 1–December 31, 2009, Recorded: June 29, 2010; posted: July 8, 2010";
	article.validContentTypes = AUDIO;
	article.url = @"http://www2c.cdc.gov/podcasts/media/mp3/mmwr5_070810.mp3";
	[issue addArticle:article];
	[article release];
	
	article = [[CdcArticle alloc] initWithTitle:@"Mosquito Alert, A Cup of Health with CDC, Transcript"];
	article.teaser = @"West Nile Virus Activity — United States, January 1–December 31, 2009, Recorded: June 29, 2010; posted: July 8, 2010";
	article.validContentTypes = PDF;
	article.pdfFile = @"mmwr5_070810_transcript";
	[issue addArticle:article];
	[article release];
	
    [pub addIssue:issue];
	[issue release];
	
    [self.library addObject:pub];
	[pub release];
    
    // create Notifiable Diseases content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:CONTINUING_EDUCATION type:REPORT];
	pub.contentTypes = HTML;
    
    [self.library addObject:pub];
	[pub release];
    
	// create Notifiable Diseases content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:MAP_NAVIGATOR type:REPORT];
	pub.contentTypes = HTML;
    
    [self.library addObject:pub];
	[pub release];
 
	// create Notifiable Diseases content and add to the library
	pub = [[CdcPublication alloc] initWithPubIdAndType:GRAPH_NAVIGATOR  type:REPORT];
	pub.contentTypes = HTML;
    
    [self.library addObject:pub];
	[pub release];
 	return self;
	
}

- (NSArray *)getPublications
{
	
	NSMutableArray *pubNames = [[NSMutableArray alloc] init];
	NSEnumerator *enumerator = [self.library objectEnumerator];
	
	// enumerate array
	for (CdcPublication *currPub in enumerator) {
		 [pubNames addObject:currPub.name];
	}
	
	NSLog(@"Publication Names retain count = %d", [pubNames retainCount]);
	return (NSArray *)pubNames;
		
}

- (NSArray *)getIssuesWithPublicationIndex:(int)pub
{
	
	return [currPublication getIssues];

}

- (NSArray *)getCurrentIssues
{
	
	NSMutableArray *issueNames = [[NSMutableArray alloc] init];
	NSEnumerator *enumerator = [self.currPublication.issues objectEnumerator];
	
	// enumerate array
	for (CdcIssue *issue in enumerator) {
		[issueNames addObject:issue.issueId];
	}
	
	return (NSArray *)issueNames;
	
}


- (NSArray *)getCurrentArticleTitles
{
	NSMutableArray *articleTitles = [[NSMutableArray alloc] init];
	NSEnumerator *enumerator = [self.currIssue.articles objectEnumerator];
	
	// enumerate array
	for (CdcArticle *article in enumerator) {
		[articleTitles addObject:article.title];
	}
	
	return (NSArray *)articleTitles;
	
}


- (NSArray *)getCurrentArticleTeasers
{
	NSMutableArray *articleTeasers = [[NSMutableArray alloc] init];
	NSEnumerator *enumerator = [self.currIssue.articles objectEnumerator];
	
	// enumerate array
	for (CdcArticle *article in enumerator) {
		[articleTeasers addObject:article.teaser];
	}
	
	return (NSArray *)articleTeasers;
	
	
}


- (void)setCurrentPublicationWithIndex:(int)pub
{
	
	self.currPublication = (CdcPublication *)[library objectAtIndex:pub];
	NSLog(@"Current Publication is now %@", self.currPublication.name);
	
}

- (void)setCurrentIssueWithIndex:(int)issue
{

	self.currIssue = (CdcIssue *)[currPublication.issues objectAtIndex:issue];
	NSLog(@"Current issue is %@ of publication %@.", self.currIssue.issueId, self.currPublication.name);
	
}

- (void)setCurrentArticleWithIndex:(int)article
{
    
	self.currArticle = (CdcArticle *)[currIssue.articles objectAtIndex:article];
	NSLog(@"Current Article is %@ of issue %@ of publication %@.", self.currArticle.title, self.currIssue.issueId, self.currPublication.name);
	
}

@end
