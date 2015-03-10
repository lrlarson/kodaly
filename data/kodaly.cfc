<cfcomponent>
   <cffunction name="init" access="remote" returntype="any">
 		 <cfreturn this />
	</cffunction>
	
	
	<cffunction name="getHeroImages" access="remote" returntype="Any" >
		<cfquery datasource="kodaly" name="images">	
			SELECT TOP 5 *
			FROM [dbo].tbl_HeroImages
			ORDER BY (NEWID())
		</cfquery>
		<cfreturn images>
	</cffunction>
	
	
	<cffunction name="insertNewEmail" access="remote" returntype="Any" >
		<cfargument name="email" type="string" required="true" >
		<cfargument name="firstName" type="string" required="true" >
		<cfargument name="lastName" type="string" required="true" >
			<cfstoredproc procedure="procInsertEmail" datasource="kodaly" >
				<cfprocparam cfsqltype="CF_SQL_NVARCHAR" value="#email#" >
				<cfprocparam cfsqltype="CF_SQL_NVARCHAR" value="#firstName#" >
				<cfprocparam cfsqltype="CF_SQL_NVARCHAR" value="#lastName#" >
				<cfprocresult name="result" >
			</cfstoredproc>	
		<cfreturn result>
	</cffunction>	
	
	 <cffunction name="getMelodicContextsForSongWeb" access="remote" returntype="Any">
    <cfargument name="titleKey" type="numeric" required="true">
    <cfquery name="melodicContexts" datasource="kodaly">
SELECT     [tbl Title Melodic Element].id, [tbl Title Melodic Element].[Title Key] AS titleKey, [tbl Title Melodic Element].[Melodic Element Key] AS melodicElementKey, 
                      [tbl Title Melodic Element].[Melodic Element context] AS melodicElementContext, [tbl Title Melodic Element].MPreparation, 
                      [tbl Title Melodic Element].[MEarly Practice] AS MearlyPractice, [tbl Title Melodic Element].[MMiddle Practice] AS MMiddlePractice, 
                      [tbl Title Melodic Element].[MLate Practice] AS MlatePractice, [tbl Title Melodic Element].MelodicContextKey, [tbl Melodic Elements].[Tone Name] AS toneName, 
                      tbl_NewMelodicContexts.contextName, [tbl Melodic Elements].[Melodic Element Key], [tbl Melodic Elements].[Tone Sequence Number], 
                      [tbl Melodic Elements].[Tone Abbreviation] AS melodicElement
FROM         [tbl Title Melodic Element] INNER JOIN
                      [tbl Melodic Elements] ON [tbl Title Melodic Element].[Melodic Element Key] = [tbl Melodic Elements].[Melodic Element Key] LEFT OUTER JOIN
                      tbl_NewMelodicContexts ON [tbl Title Melodic Element].MelodicContextKey = tbl_NewMelodicContexts.ID
WHERE     ([tbl Title Melodic Element].[Title Key] = #titleKey#)
     </cfquery>
    <cfreturn melodicContexts>
</cffunction>
	
	
	  <cffunction name="getMelContextsForElement" access="remote" returntype="Any" >
        	<cfargument name="element" type="numeric" required="true" >
        		<cfquery name="contexts" datasource="kodaly">
        				SELECT     contextName as label,ID as data
						FROM         tbl_NewMelodicContexts
						WHERE     (melodicElementKey = #element#)
						ORDER BY elementSortIndex
        		</cfquery>
        		<cfreturn contexts>
        </cffunction>
	
	
	<cffunction name="getMotivesForSong" access="remote" returntype="Any" >
		<cfargument name="title_ID" required="true" type="numeric" >
			<cfquery name="motives" datasource="kodaly4WebUser" >
				SELECT [motive]
				  FROM [tbl_Title_Motive]
					WHERE title_ID = #title_ID#
			</cfquery>
			<cfreturn motives>
	</cffunction>
	
	
	<cffunction name="getSubSubjects" access="remote" returntype="Any" >
		<cfargument name="subject" type="numeric" required="true">
			<cfquery name="subSubjects" datasource="kodaly4WebUser" >
				SELECT     Sub_Subject_Key AS data, Sub_Subject AS label
				FROM         Tbl_Sub_Subjects
				WHERE     ([Subject Heading Key] = #subject#)
			</cfquery>
			<cfreturn  subSubjects>
	</cffunction>
	
	<cffunction name="getSubGames" access="remote" returntype="Any" >
		<cfargument name="game" type="numeric" required="true">
			<cfquery name="subGames" datasource="kodaly4WebUser" >
				SELECT     Game_Subtype_ID AS data, Sub_Game_Type AS label
				FROM         Table_Sub_Game_Type
				WHERE     (relatedGameType = #game#)
			</cfquery>
			<cfreturn  subGames>
	</cffunction>
	
	

	
	<cffunction name="getFilteredTitles" access="remote" returntype="Any" > 
		<cfargument name="region" type="numeric" required="true">
		<cfargument name="state" type="numeric" required="true">
		<cfargument name="ethnic" type="numeric" required="true">
		<cfargument name="songType" type="numeric" required="true">
		<cfargument name="subject" type="numeric" required="true">
		<cfargument name="forms" type="numeric" required="true">
		<cfargument name="scale" type="numeric" required="true">
		<cfargument name="range" type="numeric" required="true">
		<cfargument name="notes" type="numeric" required="true">
		<cfargument name="melodicElement" type="numeric" required="true">
		<cfargument name="rhythmicElement" type="numeric" required="true">
		<cfargument name="meter" type="numeric" required="true">
		<cfargument name="formalAnalysis" type="numeric" required="true">
		<cfargument name="toneSet" type="string"  required="true" >
		<cfargument name="subSubject" type="numeric"  required="true" >
		<cfargument name="gameType" type="numeric"  required="true" >
		<cfargument name="motiveSet" type="string"  required="true" >
		<cfargument name="contextSet" type="numeric"  required="true" >
		<cfargument name="grades" type="string" required="true" >
		<cfargument name="searchString" type="string"  required="true" default="">
		<cfargument name="subGameType" type="numeric"  required="true" >
		
		<cfquery name="baseQuery" datasource="kodaly4WebUser" result="result">
SELECT DISTINCT tbl_Titles.ID, tbl_Titles.Title, tbl_Titles.Recording_Flag, tbl_Titles.LoC, tbl_Titles.Child, tbl_Titles.Game
FROM         tbl_Titles INNER JOIN
                      Table_Range ON tbl_Titles.rangeID = Table_Range.Range_ID LEFT OUTER JOIN
                      [tbl Title Melodic Element] ON tbl_Titles.ID = [tbl Title Melodic Element].[Title Key] LEFT OUTER JOIN
                      tbl_Title_Motive ON tbl_Titles.ID = tbl_Title_Motive.title_ID LEFT OUTER JOIN
                      [tbl Title Game Type] ON tbl_Titles.ID = [tbl Title Game Type].[Title Key] LEFT OUTER JOIN
                      [tbl Title Rhythmic Element] ON tbl_Titles.ID = [tbl Title Rhythmic Element].[Title Key] LEFT OUTER JOIN
                      [tbl Title Subject Headings] ON tbl_Titles.ID = [tbl Title Subject Headings].[Title Key] LEFT OUTER JOIN
                      [tbl Title Song Type] ON tbl_Titles.ID = [tbl Title Song Type].[Title Key]
			
			where	tbl_Titles.ID > 0
			/*Region */
			<cfif region NEQ -1>
			AND regionID = #region#	
			</cfif>
			
			/*State */
			<cfif state NEQ -1>
			AND stateID = #state#	
			</cfif>
			
			/*Ethnic */
			<cfif ethnic NEQ -1>
			AND ethnicityID = #ethnic#	
			</cfif>
			
			/*Song Type */
			<cfif songType NEQ -1>
			AND [Song Type Key] = #songType#
			</cfif>
			
			/*Subject */
			<cfif subject NEQ -1>
			AND [Subject Heading Key] = #subject#
			</cfif>
			
			/*Sub Subject */
			<cfif subSubject NEQ -1>
			AND [Sub_Subject_Key] = #subSubject#
			</cfif>
			
			/*Form Type */
			<cfif forms NEQ -1>
			AND [formTypeID] = #forms#
			</cfif>
			
			/*Scale */
			<cfif scale NEQ -1>
			AND [scaleID] = #scale#
			</cfif>
			
			/*Range */
			<cfif range NEQ -1>
			  AND rank = #range#
			</cfif>
			
			/*Notes */
			<cfif notes NEQ -1>
			AND [NOTE] = #notes#
			</cfif>
			
			/*Melodic Elements */
			<cfif melodicElement NEQ -1>
			AND [Melodic Element Key] = #melodicElement#
			</cfif>
			
			/*rhythmicElement */
			<cfif rhythmicElement NEQ -1>
			AND [Rhythmic Element Key] = #rhythmicElement#
			</cfif>
			
			/*meter */
			<cfif meter NEQ -1>
			AND meterID = #meter#
			</cfif>
			
			/*formalAnalysis */
			<cfif formalAnalysis NEQ -1>
			AND formID = #formalAnalysis#
			</cfif>
			
			/*toneSet */
			<cfif toneSet NEQ ''>
			AND toneSetID = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="#toneSet#" >
			</cfif>
			
			/*gameType */
			<cfif gameType NEQ -1>
			AND [Game Type Key] = #gameType#
			</cfif>
			
			/*subGameType */
			<cfif subGameType NEQ -1>
			AND [Sub_Game_Type_Key] = #subGameType#
			</cfif>
			
			/*motiveSet */
			<cfif motiveSet NEQ ''>
			AND motive = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="#motiveSet#" >
			</cfif>
			
			/*contextSet */
			<cfif contextSet NEQ -1>
			AND [tbl Title Melodic Element].MelodicContextKey = #contextSet#		
			</cfif>
			
			/*grades */
			
			<cfif grades NEQ "_none">
				<cfswitch expression="#grades#" >
					<cfcase value="Pre-K" >
						and ch = 1
					</cfcase>	
					<cfcase value="K" >
						AND (k = 1)
					</cfcase>
					
					<cfcase value="1" >
						AND  (one = 1)
					</cfcase>
					<cfcase value="2" >
						AND two = 1
					</cfcase>
					<cfcase value="3" >
						AND three = 1
					</cfcase>
					<cfcase value="4" >
						AND four = 1
					</cfcase>
					<cfcase value="5" >
						AND five = 1
					</cfcase>
					<cfcase value="6" >
						AND six = 1
					</cfcase>
					<cfcase value="7" >
						AND seven = 1
					</cfcase>
					<cfcase value="8" >
						AND eight = 1
					</cfcase>
					<cfcase value="HS" >
						AND (nine = 1 OR ten = 1 OR eleven=1 OR twelve=1)
					</cfcase>
					<cfcase value="Older Beginner" >
						AND zero = 1
					</cfcase>
				</cfswitch>
			</cfif>
			
			
			/* string search 8 */
			<cfif searchString NEQ ''>
				
				AND ((tbl_Titles.Title like <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="%#searchString#%">) or
				(tbl_Titles.Alt_Title_1 like <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="%#searchString#%">) or
				(tbl_Titles.First_Line_Text like <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="%#searchString#%">) or
				(tbl_Titles.correctedTitle like <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="%#searchString#%">) or
				(tbl_Titles.Alt_Title_2 like <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="20" value="%#searchString#%">))
				
			</cfif>
		ORDER BY Title				
		</cfquery>
		
		
		
		<cfreturn baseQuery>
	</cffunction>	
	
	<cffunction name="getNewsSummary" access="remote" returntype="Any" >
		<cfquery datasource="kodaly4WebUser" name="news">
				SELECT  TOP 5   tbl_News.*
				FROM         tbl_News
				WHERE newsItemPostSwitch = 1
				ORDER BY postDate DESC
		</cfquery>		
		<cfreturn news>
	</cffunction>
	
	
	<cffunction name="getNews" access="remote" returntype="Any" >
		<cfquery datasource="kodaly4WebUser" name="news">
				SELECT    tbl_News.*
				FROM         tbl_News
				WHERE newsItemPostSwitch = 1
				ORDER BY postDate DESC
		</cfquery>		
		<cfreturn news>
	</cffunction>

	<cffunction name="getSongDetails" access="remote" returntype="Any" >
		<cfargument name="ID" type="numeric" required="true" >
			<cfstoredproc procedure="procSongDetailsForWeb" datasource="kodaly" >
				<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#ID#">
				<cfprocresult name="result" >
			</cfstoredproc>		
		<cfreturn result>
	</cffunction>
	
	 <cffunction name="getMelodicContextsForSong" access="remote" returntype="Any">
    <cfargument name="titleKey" type="numeric" required="true">
    <cfquery name="melodicContexts" datasource="kodaly4WebUser">
SELECT     [tbl Title Melodic Element].id, [tbl Title Melodic Element].[Title Key] AS titleKey, [tbl Title Melodic Element].[Melodic Element Key] AS melodicElementKey, 
                      [tbl Title Melodic Element].[Melodic Element context] AS melodicElementContext, [tbl Title Melodic Element].MPreparation, 
                      [tbl Title Melodic Element].[MEarly Practice] AS MearlyPractice, [tbl Title Melodic Element].[MMiddle Practice] AS MMiddlePractice, 
                      [tbl Title Melodic Element].[MLate Practice] AS MlatePractice, [tbl Melodic Elements].[Tone Abbreviation] AS toneAbbreviation, 
                      [tbl Title Melodic Element].MelodicContextKey, [tbl Melodic Elements].[Tone Name] AS toneName
FROM         [tbl Title Melodic Element] INNER JOIN
                      [tbl Melodic Elements] ON [tbl Title Melodic Element].[Melodic Element Key] = [tbl Melodic Elements].[Melodic Element Key]
WHERE     ([tbl Title Melodic Element].[Title Key] = #titleKey#)
     </cfquery>
    <cfreturn melodicContexts>
</cffunction>

<cffunction name="getRythmicContextsForSong" access="remote" returntype="Any">
    <cfargument name="titleKey" type="numeric" required="true">
    <cfquery name="rythmicContexts" datasource="kodaly4WebUser">
SELECT     [tbl Title Rhythmic Element].id, [tbl Title Rhythmic Element].[Title Key] AS titleKey, [tbl Title Rhythmic Element].RPreparation, 
                      [tbl Title Rhythmic Element].[REarly Practice] AS rEarly, [tbl Rhythmic Elements].[Rhythm Name] AS rythmName, 
                      [tbl Title Rhythmic Element].[RMiddle Practice] AS rMiddle, [tbl Title Rhythmic Element].[RLate Practice] AS rLate, 
                      [tbl Rhythmic Elements].[Rhythm Key] AS rhythmKey
FROM         [tbl Title Rhythmic Element] INNER JOIN
                      [tbl Rhythmic Elements] ON [tbl Title Rhythmic Element].[Rhythmic Element Key] = [tbl Rhythmic Elements].[Rhythm Key]
WHERE     ([tbl Title Rhythmic Element].[Title Key] = #titleKey#)
     </cfquery>
    <cfreturn rythmicContexts>
</cffunction>

<cffunction name="getSongTypesForSong" access="remote" returntype="any">
    <cfargument name="titleKey" type="numeric" required="yes">
    <cfquery name="songTypes" datasource="kodaly4WebUser">
    SELECT     [tbl Title Song Type].id, [tbl Title Song Type].[Title Key] as titleKey, [tbl Title Song Type].[Song Type Key] as songTypeKey, [tbl Song Types].[Song Type] as songType
	FROM         [tbl Title Song Type] INNER JOIN
                      [tbl Song Types] ON [tbl Title Song Type].[Song Type Key] = [tbl Song Types].[Song Type Key]
                      WHERE [Title Key] = #titleKey#
    </cfquery>
    <cfreturn songTypes>
    </cffunction>
    
    <cffunction name="getGamesForSong" access="remote" returntype="any">
<cfargument name="titleKey" type="numeric" required="yes">
<cfquery name="getGames" datasource="kodaly4WebUser">
SELECT     [tbl Title Game Type].[Title Key] AS titleKey, [tbl Title Game Type].[Game Type Key] AS gameTypeKey, 
                      [tbl Title Game Type].Sub_Game_Type_Key AS subGameTypeKey, [tbl Title Game Type].Table_Key AS id, [tbl Game Type].[Game Type] AS gameType, 
                      [tbl Game Type].Subgame_Flag, Table_Sub_Game_Type.Sub_Game_Type AS subGameType
FROM         [tbl Title Game Type] INNER JOIN
                      [tbl Game Type] ON [tbl Title Game Type].[Game Type Key] = [tbl Game Type].[Game Type Key] INNER JOIN
                      Table_Sub_Game_Type ON [tbl Title Game Type].Sub_Game_Type_Key = Table_Sub_Game_Type.Game_Subtype_ID
WHERE     ([tbl Title Game Type].[Title Key] = #titleKey#)
</cfquery>
<cfreturn getGames>
</cffunction>

<cffunction name="getFiguresForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="figuresForSong" datasource="kodaly4WebUser">
SELECT     TOP (1000) Tbl_Title_Figures.Figure_Title_ID, Tbl_Figures.Figure, Tbl_Title_Figures.Title_Key
FROM         Tbl_Title_Figures INNER JOIN
                      Tbl_Figures ON Tbl_Title_Figures.Figure_ID = Tbl_Figures.Figure_ID
                      WHERE Title_Key = #id#
</cfquery>
<cfreturn figuresForSong>
</cffunction>

<cffunction name="getPartWorkForSong" access="remote" returntype="any">
<cfargument name="titleKey" type="numeric" required="yes">
<cfquery name="partWork" datasource="kodaly4WebUser">
SELECT     [tbl Title Part Work].[Title Part Work Key] AS titlePartKey, [tbl Title Part Work].[Title Key] AS titleKey, [tbl Title Part Work].[Part Work Key] AS partWorkKey, 
                      [tbl Title Part Work].Part_Work_Context_String, [tbl Part Work].[Part Work Description] AS partWorkName
FROM         [tbl Title Part Work] INNER JOIN
                      [tbl Part Work] ON [tbl Title Part Work].[Part Work Key] = [tbl Part Work].[Part Work Key]
                      WHERE [Title Key] = #titleKey#
</cfquery>
<cfreturn partWork>
</cffunction>

<cffunction name="getSubjectsForSong" access="remote" returntype="any">
<cfargument name="titleKey" type="numeric" required="yes" default="455">
<cfquery name="subjects" datasource="kodaly4WebUser">
SELECT    [tbl Title Subject Headings].ID_Title_Subject, [tbl Title Subject Headings].[Title Key] AS titleKey, 
                      [tbl Title Subject Headings].[Subject Heading Key] AS subjectKey, [tbl Title Subject Headings].Sub_Subject_Key AS subSubjectKey, 
                      [tbl Subject Headings].[Subject Heading] AS subjectHeading, Tbl_Sub_Subjects.Sub_Subject AS subSubjectHeading
FROM         [tbl Title Subject Headings] INNER JOIN
                      [tbl Subject Headings] ON [tbl Title Subject Headings].[Subject Heading Key] = [tbl Subject Headings].[Subject Heading Key] INNER JOIN
                      Tbl_Sub_Subjects ON [tbl Title Subject Headings].Sub_Subject_Key = Tbl_Sub_Subjects.Sub_Subject_Key
WHERE     ([tbl Title Subject Headings].[Title Key] = #titleKey#)
</cfquery>

<cfreturn subjects>
</cffunction>
	
	


</cfcomponent>