<cfcomponent>
	
	<cffunction name="init" access="remote" returntype="any">
 		 <cfreturn this />
	</cffunction>
    
    <cffunction name="getCount" access="remote" returntype="Any" >
		<cfstoredproc procedure="procGetCount" datasource="kodaly"  >
			<cfprocresult name="count" >
		</cfstoredproc>		
		<cfreturn count>	
	</cffunction>
    
    <cffunction name="getMelodicContextsList" access="remote" returntype="Any" >
    	<cfquery datasource="kodaly" name="melContexts">
			SELECT    DISTINCT [Melodic Element context] AS melContext
			FROM         [tbl Title Melodic Element]
			WHERE [Melodic Element context] <> ''
			ORDER BY [Melodic Element context]
    	</cfquery>
    	<cfreturn melContexts>
    </cffunction>
    
    <cffunction name="getMotiveList" access="remote"  returntype="any" returnformat="JSON">
    	<cfquery datasource="kodaly" name="motives">
    		SELECT     DISTINCT motive
			FROM         tbl_Title_Motive
			ORDER BY motive
    	</cfquery>
    	<cfreturn motives>
    </cffunction>
    
    <cffunction name="getToneSets" access="remote" returntype="Any" >
    	<cfquery datasource="kodaly" name="toneSets">
    		SELECT   DISTINCT  toneSetID
			FROM         tbl_Titles
			WHERE toneSetID <> ''
    	</cfquery>
    	<cfreturn toneSets>
    </cffunction>
    
    
    <cffunction name="getTitles" access="remote" returntype="any">
		<cfquery datasource="kodaly" name="titles">
        	SELECT  ID,
              Title,
              First_Line_Text,
              Analyzed
  FROM [kodaly_4].[dbo].[tbl_Titles]
  ORDER BY Title
        </cfquery>
		<cfreturn titles>
	</cffunction>
    
    
     <cffunction name="getTitlesForCBO" access="remote" returntype="any">
		<cfquery datasource="kodaly" name="titles">
        	SELECT  ID as data,
              Title as label
  FROM [kodaly_4].[dbo].[tbl_Titles]
  ORDER BY Title
        </cfquery>
		<cfreturn titles>
	</cffunction>

	<cffunction name="getSongDetails" access="remote" returntype="any">
    <cfargument name="ID" type="numeric" required="yes">
    <cfquery name="songDetails" datasource="kodaly">
   SELECT *
  FROM [kodaly_4].[dbo].[tbl_Titles]
  WHERE ID = #id#
    </cfquery>  
    <cfreturn songDetails>  
    </cffunction>

	<cffunction name="getStates" access="remote" returntype="any">
    <cfquery name="states" datasource="kodaly">
		 SELECT  State AS label, State_ID AS data
		FROM dbo.State_Table
		WHERE State_ID <> 51
		ORDER BY State
    </cfquery>
    <cfreturn states>
    </cffunction>
    
    <cffunction name="getRegions" access="remote" returntype="any">
    <cfquery name="regions" datasource="kodaly">
SELECT Region_ID AS data, Region AS label
FROM dbo.Region_Table
WHERE Region_ID <> 16 
ORDER BY Region
    </cfquery>
    <cfreturn regions>
    </cffunction>
    
    <cffunction name="getEthnicity" access="remote" returntype="any">
    <cfquery name="ethicy" datasource="kodaly">
SELECT Ethnicity_ID AS data, Ethnicity AS label
FROM dbo.Ethnicity_Table
WHERE Ethnicity_ID <> 13 and Ethnicity_ID <> 10
ORDER BY Ethnicity
    </cfquery>
    <cfreturn ethicy>
    </cffunction>
    
     <cffunction name="getMotivesForSong" access="remote" returntype="Any">
         <cfargument name="title_ID" type="numeric" required="true">
         <cfquery name="motivesForSong" datasource="kodaly">
           SELECT     title_ID, motive
FROM         tbl_Title_Motive
WHERE     (title_ID = #title_ID#)  
         </cfquery>
         <cfreturn motivesForSong>
     </cffunction>
     
     <cffunction name="insertMotiveToSong" access="remote" returntype="Any">
         <cfargument name="motive" type="any" required="true">
         <cfquery name="newMotive" datasource="kodaly">
             INSERT INTO dbo.tbl_Title_Motive
        ( title_ID, motive )
VALUES  ( #motive.title_ID#, -- title_ID - int
          '#motive.motive#'  -- motive - nvarchar(50)
          )
          SELECT 1
         </cfquery>
         
        <cfreturn  newMotive>
         
     </cffunction>
     
      <cffunction name="deleteMotiveForSong" access="remote" returntype="Any">
         <cfargument name="motive" type="any" required="true">
         <cfquery name="newMotive" datasource="kodaly">
             DELETE FROM dbo.tbl_Title_Motive
WHERE motive = '#motive.motive#'  AND title_ID = #motive.title_ID#
          SELECT 1
         </cfquery>
         
        <cfreturn  newMotive>
         
     </cffunction>
     
     
     
     
     <cffunction name="getScales" access="remote" returntype="any">
    <cfquery name="scales" datasource="kodaly">
SELECT [Scale Key] AS data, Scale AS label 
FROM dbo.[tbl Scales]
WHERE [Scale Key] <> 19
ORDER BY Scale
    </cfquery>
    <cfreturn scales>
    </cffunction>
    
     <cffunction name="getNotes" access="remote" returntype="any">
    <cfquery name="notes" datasource="kodaly">
SELECT Note_ID AS data , Note AS label
FROM dbo.Note_Table
WHERE Note_ID <> 8
ORDER BY Note_ID
    </cfquery>
    <cfreturn notes>
    </cffunction>
    
     <cffunction name="getRange" access="remote" returntype="any">
    <cfquery name="range" datasource="kodaly">
SELECT Range_ID AS data, Range AS label
FROM dbo.Table_Range
WHERE Range_ID <> 17
ORDER BY Sort_Order ASC
    </cfquery>
    <cfreturn range>
    </cffunction>


     <cffunction name="getMeters" access="remote" returntype="any">
    <cfquery name="meters" datasource="kodaly">
SELECT      [tbl Meters].[Meter Key] AS data, [tbl Meters].Meter AS label
FROM          [tbl Meters]
WHERE [Meter Key] <> 14
order by [Meter Sequence Number]
    </cfquery>
    <cfreturn meters>
    </cffunction>
    
     <cffunction name="getForms" access="remote" returntype="any">
    <cfquery name="forms" datasource="kodaly">
SELECT      [tbl Forms].[Form Key] AS data, [tbl Forms].[Form Name] AS label
FROM          [tbl Forms]
WHERE [Form Key] <> 44
ORDER BY [tbl Forms].[Form Sequence Number] 
</cfquery>
    <cfreturn forms>
    </cffunction>
    
      <cffunction name="getFormType" access="remote" returntype="any">
    <cfquery name="formType" datasource="kodaly">
SELECT      [tbl_Form_Type].[Form_Type_Key] AS data, [tbl_Form_Type].[Form_Type] AS label
FROM          [tbl_Form_Type]
WHERE Form_Type_Key <> 10
ORDER BY Form_Type
</cfquery>
    <cfreturn formType>
    </cffunction>
    
     <cffunction name="getStartingPitch" access="remote" returntype="any">
    <cfquery name="startingPitch" datasource="kodaly">
SELECT      Starting_Pitch_Table.Starting_Pitch_ID AS data, Starting_Pitch_Table.Starting_Pitch AS label
FROM          Starting_Pitch_Table
ORDER BY sequence

</cfquery>
    <cfreturn startingPitch>
    </cffunction>
    
    <cffunction name="getMelodicElements" access="remote" returntype="any">
    <cfquery name="elements" datasource="kodaly">
SELECT [Melodic Element Key] AS data
      ,[Tone Abbreviation] AS label
  FROM [kodaly_4].[dbo].[tbl Melodic Elements]
  where [Tone Abbreviation] <> '_None'
  ORDER BY [Tone Sequence Number]

</cfquery>
    <cfreturn elements>
    </cffunction>
    
    <cffunction name="getMelodicContexts" access="remote" returntype="any">
    <cfquery name="elements" datasource="kodaly">
SELECT     id AS data, [melodic Context] AS label
FROM         tbl_MelodicContext

</cfquery>
    <cfreturn elements>
    </cffunction>
    
   <cffunction name="getMelodicContextsForSong" access="remote" returntype="Any">
    <cfargument name="titleKey" type="numeric" required="true">
    <cfquery name="melodicContexts" datasource="kodaly">
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
    <cfquery name="rythmicContexts" datasource="kodaly">
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

<cffunction name="deleteMelodicContextForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="deleteMelodicContextRecord" datasource="kodaly">
DELETE FROM dbo.[tbl Title Melodic Element]
WHERE  id =#id#
select 1
</cfquery>
<cfreturn deleteMelodicContextRecord>
</cffunction>

<cffunction name="deleteRythmicContextForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="deleteRythmicContextRecord" datasource="kodaly">
DELETE FROM dbo.[tbl Title Rhythmic Element]
WHERE id = #id#
select 1
</cfquery>
</cffunction>



    <cffunction name="getRythmicElements" access="remote" returntype="any">
    <cfquery name="elements" datasource="kodaly">
SELECT [Rhythm Key] as data, [Rhythm Name] as label
FROM dbo.[tbl Rhythmic Elements]
WHERE [Rhythm Name] IS NOT NULL
ORDER BY [Rhythm Name]

</cfquery>
    <cfreturn elements>
    </cffunction>


	<cffunction name="insertMelodicContext" access="remote" returntype="any">
    <cfargument name="MelodicContext" type="any" required="yes">
    <cfif #MelodicContext.MPreparation# EQ "true">
	<cfset MelodicContext.MPreparation = 1>
    <cfelse>
    <cfset MelodicContext.MPreparation = 0>
	</cfif>
    <cfif #MelodicContext.MearlyPractice# EQ "true">
	<cfset MelodicContext.MearlyPractice = 1>
    <cfelse>
    <cfset MelodicContext.MearlyPractice = 0>
	</cfif>
    <cfif #MelodicContext.MMiddlePractice# EQ "true">
	<cfset MelodicContext.MMiddlePractice = 1>
    <cfelse>
    <cfset MelodicContext.MMiddlePractice = 0>
	</cfif>
    <cfif #MelodicContext.MlatePractice# EQ "true">
	<cfset MelodicContext.MlatePractice = 1>
    <cfelse>
    <cfset MelodicContext.MlatePractice = 0>
	</cfif>
    <cfquery name="insert" datasource="kodaly">
    INSERT INTO dbo.[tbl Title Melodic Element]
        ( [Title Key] ,
          [Melodic Element Key] ,
           [Melodic Element context],
          MPreparation ,
          [MEarly Practice] ,
          [MMiddle Practice] ,
          [MLate Practice]
        )
VALUES  ( #MelodicContext.titleKey# , -- Title Key - int
          #MelodicContext.melodicElementKey#, -- Melodic Element Key - int

          '#MelodicContext.melodicContext#' , -- Melodic Element Context -- string
          
         #MelodicContext.MPreparation# , -- MPreparation - bit
          #MelodicContext.MearlyPractice# , -- MEarly Practice - bit
          #MelodicContext.MMiddlePractice# , -- MMiddle Practice - bit
         #MelodicContext.MlatePractice#  -- MLate Practice - bit
        )
        select @@identity
    </cfquery>
    <cfreturn insert>
    </cffunction>

	<cffunction name="insertRythmicContext" access="remote" returntype="any">
    <cfargument name="rythmicContext" required="yes" type="any">
    
	<cfif rythmicContext.rLate EQ "true">
	<cfset rythmicContext.rLate = 1>
    <cfelse>
    <cfset rythmicContext.rLate = 0>
    </cfif>
    
    <cfif rythmicContext.rEarly EQ "true">
	<cfset rythmicContext.rEarly = 1>
    <cfelse>
    <cfset rythmicContext.rEarly = 0>
    </cfif>
    
    <cfif rythmicContext.rMiddle EQ "true">
	<cfset rythmicContext.rMiddle = 1>
    <cfelse>
    <cfset rythmicContext.rMiddle = 0>
    </cfif>
    
    <cfif rythmicContext.RPreparation EQ "true">
	<cfset rythmicContext.RPreparation = 1>
    <cfelse>
    <cfset rythmicContext.RPreparation = 0>
    </cfif>
    
    
    
    <cfquery name="newContext" datasource="kodaly">
    INSERT INTO dbo.[tbl Title Rhythmic Element]
        ( [Title Key] ,
          [Rhythmic Element Key] ,
        
          RPreparation ,
          [REarly Practice] ,
          [RMiddle Practice] ,
          [RLate Practice]
        
        )
VALUES  ( #rythmicContext.titleKey#, -- Title Key - int
          #rythmicContext.rhythmKey# , -- Rhythmic Element Key - int
          #rythmicContext.RPreparation# , -- RPreparation - bit
          #rythmicContext.rEarly# , -- REarly Practice - bit
         #rythmicContext.rMiddle#  , -- RMiddle Practice - bit
          #rythmicContext.rLate#  -- RLate Practice - bit
		
        )
        select @@identity
    </cfquery>
    <cfreturn newContext>
    </cffunction>


	<cffunction name="getSongTypesForSong" access="remote" returntype="any">
    <cfargument name="titleKey" type="numeric" required="yes">
    <cfquery name="songTypes" datasource="kodaly">
    SELECT     [tbl Title Song Type].id, [tbl Title Song Type].[Title Key] as titleKey, [tbl Title Song Type].[Song Type Key] as songTypeKey, [tbl Song Types].[Song Type] as songType
	FROM         [tbl Title Song Type] INNER JOIN
                      [tbl Song Types] ON [tbl Title Song Type].[Song Type Key] = [tbl Song Types].[Song Type Key]
                      WHERE [Title Key] = #titleKey#
    </cfquery>
    <cfreturn songTypes>
    </cffunction>
	
    <cffunction name="getSongTypes" access="remote" returntype="any">
    <cfquery name="songTypes" datasource="kodaly">
    SELECT     [Song Type Key] AS data, [Song Type] AS label
    FROM         [tbl Song Types]
    WHERE [Song Type]IS NOT NULL AND [Song Type Key]<>81
    ORDER BY [Song Type]
    </cfquery>
    <cfreturn songTypes>
    </cffunction>
    
    <cffunction name="insertSongTypeForSong" access="remote" returntype="any">
   <cfargument name="songTypeRecord" type="any" required="yes">
    <cfquery name="insertSongType" datasource="kodaly">
    INSERT INTO dbo.[tbl Title Song Type]
        ( [Title Key], [Song Type Key] )
		VALUES  ( #songTypeRecord.titleKey#, -- Title Key - int
          #songTypeRecord.songTypeKey# -- Song Type Key - int
          )  
          select 1            
    </cfquery>
    <cfreturn insertSongType>
    </cffunction>
    
    <cffunction name="deleteSongTypeForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="deleteSongTypeRecord" datasource="kodaly">
DELETE FROM dbo.[tbl Title Song Type]
WHERE id = #id#
select 1
</cfquery>
</cffunction>

<cffunction name="getGamesForSong" access="remote" returntype="any">
<cfargument name="titleKey" type="numeric" required="yes">
<cfquery name="getGames" datasource="kodaly">
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

<cffunction name="getGameTypes" access="remote" returntype="any">
<cfquery name="gameTypes" datasource="kodaly">
SELECT     [Game Type Key] AS data, [Game Type] AS label
FROM         [tbl Game Type]
WHERE [Game Type Key]<>21
ORDER BY [Game Type]
</cfquery>
<cfreturn gameTypes>
</cffunction>

<cffunction name="getRelatedGameTypes" access="remote" returntype="any">
<cfargument name="gameTypeKey" type="numeric" required="yes">
<cfquery name="relatedGames" datasource="kodaly">
SELECT     Game_Subtype_ID AS data, Sub_Game_Type AS label
FROM         Table_Sub_Game_Type
WHERE     (relatedGameType = #gameTypeKey#)
</cfquery>
<cfreturn relatedGames>
</cffunction>

<cffunction name="insertGameTypeForSong" access="remote" returntype="any">
<cfargument name="gameTypeForSong" required="yes" type="any">
<cfquery name="insertGameType" datasource="kodaly">
INSERT INTO dbo.[tbl Title Game Type]
          ( [Title Key] ,
            [Game Type Key] ,
            Sub_Game_Type_Key
          )
  VALUES  ( #gameTypeForSong.titleKey#, -- Title Key - int
            #gameTypeForSong.gameTypeKey# , -- Game Type Key - int
            #gameTypeForSong.subGameTypeKey# -- Sub_Game_Type_Key - int
          )
          select @@IDENTITY
</cfquery>
<cfreturn insertGameType>
</cffunction>

<cffunction name="deleteGameTypeForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="delete" datasource="kodaly">
DELETE FROM dbo.[tbl Title Game Type]
          WHERE Table_Key = #id#
          select 1
</cfquery>
<cfreturn delete>
</cffunction>


<cffunction name="getFigures" access="remote" returntype="any">
<cfquery name="figures" datasource="kodaly">
select Figure_ID AS data, Figure AS label
FROM tbl_Figures
ORDER BY Figure
</cfquery>
<cfreturn figures>
</cffunction>

<cffunction name="getFiguresForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="figuresForSong" datasource="kodaly">
SELECT     TOP (1000) Tbl_Title_Figures.Figure_Title_ID, Tbl_Figures.Figure, Tbl_Title_Figures.Title_Key
FROM         Tbl_Title_Figures INNER JOIN
                      Tbl_Figures ON Tbl_Title_Figures.Figure_ID = Tbl_Figures.Figure_ID
                      WHERE Title_Key = #id#
</cfquery>
<cfreturn figuresForSong>
</cffunction>

<cffunction name="addFigureToSong" access="remote" returntype="any">
<cfargument name="figuresForSong" type="any" required="yes">
<cfquery name="addFigure" datasource="kodaly">
INSERT INTO dbo.Tbl_Title_Figures
        ( Title_Key, Figure_ID )
VALUES  ( #figuresForSong.TITLE_KEY#, -- Title_Key - int
          #figuresForSong.Figure_Title_ID#  -- Figure_ID - int
          )
select @@identity          
</cfquery>
<cfreturn addFigure>
</cffunction>

<cffunction name="deleteFigureFromSong" access="remote" returntype="any">
<cfargument name="Figure_Title_ID" type="numeric" required="yes">
<cfquery name="removeFigure" datasource="kodaly">
DELETE FROM [Tbl_Title_Figures]
  WHERE Figure_Title_ID = #Figure_Title_ID#
  select 1
</cfquery>
<cfreturn removeFigure>
</cffunction>


<cffunction name="getPartWorkForSong" access="remote" returntype="any">
<cfargument name="titleKey" type="numeric" required="yes">
<cfquery name="partWork" datasource="kodaly">
SELECT     [tbl Title Part Work].[Title Part Work Key] AS titlePartKey, [tbl Title Part Work].[Title Key] AS titleKey, [tbl Title Part Work].[Part Work Key] AS partWorkKey, 
                      [tbl Title Part Work].Part_Work_Context_String, [tbl Part Work].[Part Work Description] AS partWorkName
FROM         [tbl Title Part Work] INNER JOIN
                      [tbl Part Work] ON [tbl Title Part Work].[Part Work Key] = [tbl Part Work].[Part Work Key]
                      WHERE [Title Key] = #titleKey#
</cfquery>
<cfreturn partWork>
</cffunction>

<cffunction name="getPartWorkNames" access="remote" returntype="any">
<cfquery name="partWorkNames" datasource="kodaly">
SELECT [Part Work Key] AS data
      ,[Part Work Sequence Number] as sequence
      ,[Part Work Description] AS label
  FROM [kodaly_4].[dbo].[tbl Part Work]
  ORDER BY [Part Work Description]
</cfquery>
<cfreturn partWorkNames>
</cffunction>

<cffunction name="insertPartWorkForSong" access="remote" returntype="any">
<cfargument name="partWorkForSong" type="any">
<cfquery name="insertPartWork" datasource="kodaly">


INSERT INTO dbo.[tbl Title Part Work]
        ( [Title Key] ,
          [Part Work Key] ,
          Part_Work_Context_String
        )
VALUES  ( #partWorkForSong.titleKey# , -- Title Key - int
          #partWorkForSong.partWorkKey# , -- Part Work Key - int
          '#partWorkForSong.partWorkName#' -- Part_Work_Context_String - nvarchar(50)
        )
   select @@identity
 </cfquery>
 <cfreturn  insertPartWork>     
</cffunction>

<cffunction name="deletePartWorkForSong" access="remote" returntype="any">
<cfargument name="tableID" type="numeric" required="yes">
<cfquery name="deletePart" datasource="kodaly">
DELETE FROM dbo.[tbl Title Part Work]
WHERE [Title Part Work Key] = #tableID#
select 1
</cfquery>
<cfreturn deletePart>
</cffunction>




<cffunction name="getSubjectsForSong" access="remote" returntype="any">
<cfargument name="titleKey" type="numeric" required="yes" default="455">
<cfquery name="subjects" datasource="kodaly">
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

<cffunction name="getSubjectHeading" access="remote" returntype="any">
<cfquery name="subjectHeading" datasource="kodaly">
SELECT     [Subject Heading Key] AS data, [Subject Heading] AS label
FROM         kodaly_4.dbo.[tbl Subject Headings]
WHERE [Subject Heading Key] <> 60
ORDER BY label
</cfquery>
<cfreturn subjectHeading>
</cffunction>

<cffunction name="getRelatedSubjects" access="remote" returntype="any">
<cfargument name="mainSubject" required="yes" type="numeric">
<cfquery name="getRelatedTypes" datasource="kodaly">
SELECT [id]
      ,[Sub_Subject_Key] as data
      ,[Sub_Subject] AS label
      ,[Subject Heading Key] AS subjectHeadingKey
  FROM [kodaly_4].[dbo].[Tbl_Sub_Subjects]
  WHERE [Subject Heading Key] = #mainSubject# OR [Sub_Subject_Key] = 29
  order by [Sub_Subject]
</cfquery>
<cfreturn getRelatedTypes>
</cffunction>

<cffunction name="insertNewSubject" access="remote" returntype="any">
<cfargument name="subjectForSong" type="any" required="yes">
<cfquery name="insertSubject" datasource="kodaly">
INSERT INTO dbo.[tbl Title Subject Headings]
        ( [Title Key] ,
          [Subject Heading Key] ,
          Sub_Subject_Key
        )
VALUES  ( #subjectForSong.titleKey# , -- Title Key - int
          #subjectForSong.subjectKey# , -- Subject Heading Key - int
          #subjectForSong.subSubjectKey#  -- Sub_Subject_Key - int
        )
        select @@identity
</cfquery>
<cfreturn insertSubject>
</cffunction>


<cffunction name="deleteSubjectFromSong" access="remote" returntype="any">
<cfargument  name="ID_Title_Subject" required="yes" type="numeric">
<cfquery name="deleteSubject" datasource="kodaly">
DELETE FROM dbo.[tbl Title Subject Headings] 
WHERE ID_Title_Subject = #ID_Title_Subject#
Select 1
</cfquery>
<cfreturn deleteSubject>
</cffunction>

<cffunction name="insertNewSong" access="remote" returntype="any">
<cfargument name="SongDetails" type="any" required="yes">

<cfif #SongDetails.Analyzed# eq "true">
<cfset SongDetails.Analyzed = 1>
<cfelse>
<cfset SongDetails.Analyzed = 0>
</cfif>
<cfif #SongDetails.inFinale# eq "true">
<cfset SongDetails.inFinale = 1>
<cfelse>
<cfset SongDetails.inFinale = 0>
</cfif>
<cfif #SongDetails.Proofed_Flag# eq "true">
<cfset SongDetails.Proofed_Flag = 1>
<cfelse>
<cfset SongDetails.Proofed_Flag = 0>
</cfif>
<cfif #SongDetails.IP_Status# eq "true">
<cfset SongDetails.IP_Status = 1>
<cfelse>
<cfset SongDetails.IP_Status = 0>
</cfif>
<cfif #SongDetails.LoC# eq "true">
<cfset SongDetails.LoC = 1>
<cfelse>
<cfset SongDetails.LoC = 0>
</cfif>
<cfif #SongDetails.Child# eq "true">
<cfset SongDetails.Child = 1>
<cfelse>
<cfset SongDetails.Child = 0>
</cfif>



<cfquery datasource="kodaly" name="newID">
INSERT INTO dbo.tbl_Titles
        ( Title ,
          Alt_Title_1 ,
          Alt_Title_2 ,
          First_Line_Text ,
          Informant ,
          scaleID ,
          NOTE ,
          tonalCenterID ,
          meterID ,
          formID ,
          stateID ,
          regionID ,
          rangeID ,
          toneSetID ,
          formAnalysisStr ,
          Analyzed ,
          [Proofed_Flag] ,
          inFinale ,
          IP_Status,
          LoC,
          Child, 
          Comments, 
          Publication,
          Song_Background  
          
        )
VALUES  ( '#SongDetails.Title#' , -- Title - nvarchar(255)
           '#SongDetails.Alt_Title_1#'  , -- Alt_Title_1 - nvarchar(50)
          '#SongDetails.Alt_Title_2#'  , -- Alt_Title_2 - nvarchar(50)
          '#SongDetails.First_Line_Text#'  , -- First_Line_Text - nvarchar(250)
          '#SongDetails.Informant#' , -- Informant - nvarchar(250)
           #SongDetails.scaleID#, -- scaleID - int
         #SongDetails.NOTE#, -- NOTE - int
          #SongDetails.tonalCenterID# , -- tonalCenterID - int
          #SongDetails.meterID# , -- meterID - int
          #SongDetails.formID# , -- formID - int
          #SongDetails.stateID# , -- stateID - int
          #SongDetails.regionID#  , -- regionID - int
          #SongDetails.rangeID#, -- rangeID - int
         '#SongDetails.toneSetID#'  , -- toneSetID - nvarchar(50)
          '#SongDetails.formAnalysisStr#'  , -- formAnalysisStr - nvarchar(50)
         
          #SongDetails.Analyzed# , -- Analyzed - bit
          #SongDetails.Proofed_Flag# , -- [Proofed_Flag] - bit
          #SongDetails.inFinale# , -- inFinale - bit
          #SongDetails.IP_Status# ,
           #SongDetails.LoC#,
         #SongDetails.Child#, -- Child - bit
         '#SongDetails.Comments#',
         '#SongDetails.Publication#',
         '#SongDetails.Song_Background#'
         
        
        )
        SELECT @@IDENTITY as newID
</cfquery>
<cfreturn newID>
</cffunction>

<cffunction name="updateSong" access="remote" returntype="any">
<cfargument name="SongDetails" type="any">

<!--- boolean sections --->
<cfif #SongDetails.Analyzed# eq "true">
<cfset SongDetails.Analyzed = 1>
<cfelse>
<cfset SongDetails.Analyzed = 0>
</cfif>
<cfif #SongDetails.inFinale# eq "true">
<cfset SongDetails.inFinale = 1>
<cfelse>
<cfset SongDetails.inFinale = 0>
</cfif>
<cfif #SongDetails.Proofed_Flag# eq "true">
<cfset SongDetails.Proofed_Flag = 1>
<cfelse>
<cfset SongDetails.Proofed_Flag = 0>
</cfif>
<cfif #SongDetails.IP_Status# eq "true">
<cfset SongDetails.IP_Status = 1>
<cfelse>
<cfset SongDetails.IP_Status = 0>
</cfif>
<cfif #SongDetails.LoC# eq "true">
<cfset SongDetails.LoC = 1>
<cfelse>
<cfset SongDetails.LoC = 0>
</cfif>
<cfif #SongDetails.Child# eq "true">
<cfset SongDetails.Child = 1>
<cfelse>
<cfset SongDetails.Child = 0>
</cfif>

<cfif #SongDetails.one# eq "true">
<cfset SongDetails.one = 1>
<cfelse>
<cfset SongDetails.one = 0>
</cfif>

<cfif #SongDetails.two# eq "true">
<cfset SongDetails.two = 1>
<cfelse>
<cfset SongDetails.two = 0>
</cfif>

<cfif #SongDetails.three# eq "true">
<cfset SongDetails.three = 1>
<cfelse>
<cfset SongDetails.three = 0>
</cfif>

<cfif #SongDetails.four# eq "true">
<cfset SongDetails.four = 1>
<cfelse>
<cfset SongDetails.four = 0>
</cfif>

<cfif #SongDetails.five# eq "true">
<cfset SongDetails.five = 1>
<cfelse>
<cfset SongDetails.five = 0>
</cfif>

<cfif #SongDetails.six# eq "true">
<cfset SongDetails.six = 1>
<cfelse>
<cfset SongDetails.six = 0>
</cfif>

<cfif #SongDetails.seven# eq "true">
<cfset SongDetails.seven = 1>
<cfelse>
<cfset SongDetails.seven = 0>
</cfif>

<cfif #SongDetails.eight# eq "true">
<cfset SongDetails.eight = 1>
<cfelse>
<cfset SongDetails.eight = 0>
</cfif>

<cfif #SongDetails.nine# eq "true">
<cfset SongDetails.nine = 1>
<cfelse>
<cfset SongDetails.nine = 0>
</cfif>

<cfif #SongDetails.ten# eq "true">
<cfset SongDetails.ten = 1>
<cfelse>
<cfset SongDetails.ten = 0>
</cfif>


<cfif #SongDetails.k# eq "true">
<cfset SongDetails.k = 1>
<cfelse>
<cfset SongDetails.k = 0>
</cfif>

<cfif #SongDetails.zero# eq "true">
<cfset SongDetails.zero= 1>
<cfelse>
<cfset SongDetails.zero = 0>
</cfif>

<cfif #SongDetails.ch# eq "true">
<cfset SongDetails.ch= 1>
<cfelse>
<cfset SongDetails.ch = 0>
</cfif>

<cfif #SongDetails.ta# eq "true">
<cfset SongDetails.ta= 1>
<cfelse>
<cfset SongDetails.ta = 0>
</cfif>

<cfif #SongDetails.ti_ti# eq "true">
<cfset SongDetails.ti_ti= 1>
<cfelse>
<cfset SongDetails.ti_ti = 0>
</cfif>

<cfif #SongDetails.rest# eq "true">
<cfset SongDetails.rest= 1>
<cfelse>
<cfset SongDetails.rest = 0>
</cfif>

<cfif #SongDetails.ta_a# eq "true">
<cfset SongDetails.ta_a= 1>
<cfelse>
<cfset SongDetails.ta_a = 0>
</cfif>

<cfif #SongDetails.half_rest# eq "true">
<cfset SongDetails.half_rest= 1>
<cfelse>
<cfset SongDetails.half_rest = 0>
</cfif>

<cfif #SongDetails.ta_a_a# eq "true">
<cfset SongDetails.ta_a_a= 1>
<cfelse>
<cfset SongDetails.ta_a_a = 0>
</cfif>

<cfif #SongDetails.ta_a_a_a# eq "true">
<cfset SongDetails.ta_a_a_a= 1>
<cfelse>
<cfset SongDetails.ta_a_a_a = 0>
</cfif>

<cfif #SongDetails.whole_rest# eq "true">
<cfset SongDetails.whole_rest= 1>
<cfelse>
<cfset SongDetails.whole_rest = 0>
</cfif>

<cfif #SongDetails.tiri_tiri# eq "true">
<cfset SongDetails.tiri_tiri= 1>
<cfelse>
<cfset SongDetails.tiri_tiri = 0>
</cfif>

<cfif #SongDetails.ti_tiri# eq "true">
<cfset SongDetails.ti_tiri= 1>
<cfelse>
<cfset SongDetails.ti_tiri = 0>
</cfif>

<cfif #SongDetails.tiri_ti# eq "true">
<cfset SongDetails.tiri_ti= 1>
<cfelse>
<cfset SongDetails.tiri_ti = 0>
</cfif>

<cfif #SongDetails.ti_ta_ti# eq "true">
<cfset SongDetails.ti_ta_ti= 1>
<cfelse>
<cfset SongDetails.ti_ta_ti = 0>
</cfif>

<cfif #SongDetails.tai_ti# eq "true">
<cfset SongDetails.tai_ti= 1>
<cfelse>
<cfset SongDetails.tai_ti = 0>
</cfif>

<cfif #SongDetails.ti_tai# eq "true">
<cfset SongDetails.ti_tai= 1>
<cfelse>
<cfset SongDetails.ti_tai = 0>
</cfif>

<cfif #SongDetails.eighth_rest# eq "true">
<cfset SongDetails.eighth_rest= 1>
<cfelse>
<cfset SongDetails.eighth_rest = 0>
</cfif>

<cfif #SongDetails.ti# eq "true">
<cfset SongDetails.ti= 1>
<cfelse>
<cfset SongDetails.ti = 0>
</cfif>

<cfif #SongDetails.tiri# eq "true">
<cfset SongDetails.tiri= 1>
<cfelse>
<cfset SongDetails.tiri = 0>
</cfif>

<cfif #SongDetails.tim_ri# eq "true">
<cfset SongDetails.tim_ri= 1>
<cfelse>
<cfset SongDetails.tim_ri = 0>
</cfif>

<cfif #SongDetails.ri_tim# eq "true">
<cfset SongDetails.ri_tim= 1>
<cfelse>
<cfset SongDetails.ri_tim = 0>
</cfif>

<cfif #SongDetails.tri_o_la# eq "true">
<cfset SongDetails.tri_o_la= 1>
<cfelse>
<cfset SongDetails.tri_o_la = 0>
</cfif>

<cfif #SongDetails.ti_ti_ti# eq "true">
<cfset SongDetails.ti_ti_ti= 1>
<cfelse>
<cfset SongDetails.ti_ti_ti = 0>
</cfif>

<cfif #SongDetails.ta_ti# eq "true">
<cfset SongDetails.ta_ti= 1>
<cfelse>
<cfset SongDetails.ta_ti = 0>
</cfif>

<cfif #SongDetails.ti_ta# eq "true">
<cfset SongDetails.ti_ta= 1>
<cfelse>
<cfset SongDetails.ti_ta = 0>
</cfif>

<cfif #SongDetails.tai# eq "true">
<cfset SongDetails.tai= 1>
<cfelse>
<cfset SongDetails.tai = 0>
</cfif>

<cfif #SongDetails.tim_ri_ti# eq "true">
<cfset SongDetails.tim_ri_ti= 1>
<cfelse>
<cfset SongDetails.tim_ri_ti = 0>
</cfif>

<cfif #SongDetails.ri_tim_ti# eq "true">
<cfset SongDetails.ri_tim_ti= 1>
<cfelse>
<cfset SongDetails.ri_tim_ti = 0>
</cfif>

<cfif #SongDetails.ti_tim_ri# eq "true">
<cfset SongDetails.ti_tim_ri= 1>
<cfelse>
<cfset SongDetails.ti_tim_ri = 0>
</cfif>

<cfif #SongDetails.tika_tika_tika# eq "true">
<cfset SongDetails.tika_tika_tika= 1>
<cfelse>
<cfset SongDetails.tika_tika_tika = 0>
</cfif>

<cfif #SongDetails.tie# eq "true">
<cfset SongDetails.tie= 1>
<cfelse>
<cfset SongDetails.tie = 0>
</cfif>

<cfif #SongDetails.other_other# eq "true">
<cfset SongDetails.other_other= 1>
<cfelse>
<cfset SongDetails.other_other = 0>
</cfif>



<cfif #SongDetails.Anac# eq "true">
<cfset SongDetails.Anac= 1>
<cfelse>
<cfset SongDetails.Anac = 0>
</cfif>

<cfif #SongDetails.Ri# eq "true">
<cfset SongDetails.Ri= 1>
<cfelse>
<cfset SongDetails.Ri = 0>
</cfif>

<cfif #SongDetails.Tim# eq "true">
<cfset SongDetails.Tim= 1>
<cfelse>
<cfset SongDetails.Tim = 0>
</cfif>

<cfif #SongDetails.ri_tim_ri# eq "true">
<cfset SongDetails.ri_tim_ri= 1>
<cfelse>
<cfset SongDetails.ri_tim_ri = 0>
</cfif>

<cfif #SongDetails.IP_Status# eq "true">
<cfset SongDetails.IP_Status= 1>
<cfelse>
<cfset SongDetails.IP_Status = 0>
</cfif>

<cfif #SongDetails.Game# eq "true">
<cfset SongDetails.Game= 1>
<cfelse>
<cfset SongDetails.Game = 0>
</cfif>

<cfquery name="editSong" datasource="kodaly">
 			update tbl_Titles
            set
            Title = '#SongDetails.Title#' ,
          Alt_Title_1 = '#SongDetails.Alt_Title_1#' ,
          Alt_Title_2 =  '#SongDetails.Alt_Title_2#'  ,
          First_Line_Text = '#SongDetails.First_Line_Text#' ,
          Informant = '#SongDetails.Informant#',
          scaleID =  #SongDetails.scaleID# ,
          NOTE = #SongDetails.NOTE# ,
          tonalCenterID = #SongDetails.tonalCenterID#  ,
          meterID = #SongDetails.meterID# ,
          formID = #SongDetails.formID#  ,


          stateID = #SongDetails.stateID# ,
          regionID = #SongDetails.regionID# ,

          rangeID = #SongDetails.rangeID# ,
          toneSetID = '#SongDetails.toneSetID#' ,

          formAnalysisStr = '#SongDetails.formAnalysisStr#' ,
          Analyzed =  #SongDetails.Analyzed# ,

          inFinale = #SongDetails.inFinale#  ,
          Starting_PitchID = #SongDetails.Starting_PitchID# ,
          ethnicityID =  #SongDetails.ethnicityID# ,
          Publication = '#SongDetails.Publication#' ,
          Comments = '#SongDetails.Comments#' ,
          formTypeID = #SongDetails.formTypeID# ,

          Notation_File_Name = '#SongDetails.Notation_File_Name#' ,

          one = #SongDetails.one# ,
          two = #SongDetails.two# ,
          three = #SongDetails.three# ,
          four =  #SongDetails.four# ,
          five =  #SongDetails.five# ,
          six =  #SongDetails.six#,
          seven =   #SongDetails.seven# ,
          eight =   #SongDetails.eight# ,
          nine =  #SongDetails.nine#,
          ten = #SongDetails.ten# ,
        
          k =  #SongDetails.k# ,
          zero =  #SongDetails.zero#,
          ch =  #SongDetails.ch# ,
          ta = #SongDetails.ta# ,
          ti_ti =   #SongDetails.ti_ti#,
          rest =  #SongDetails.rest# ,
          ta_a = #SongDetails.ta_a#  ,
          half_rest = #SongDetails.half_rest#   ,
          ta_a_a = #SongDetails.ta_a_a#,
          ta_a_a_a = #SongDetails.ta_a_a_a# ,
          whole_rest = #SongDetails.whole_rest# ,
          tiri_tiri = #SongDetails.tiri_tiri#  ,
          ti_tiri = #SongDetails.ti_tiri# ,
          tiri_ti = #SongDetails.tiri_ti#,
          ti_ta_ti = #SongDetails.ti_ta_ti# ,
          tai_ti = #SongDetails.tai_ti#,
          ti_tai = #SongDetails.ti_tai# ,
          eighth_rest = #SongDetails.eighth_rest#  ,
          ti = #SongDetails.ti#  ,
          tiri = #SongDetails.tiri#  ,
          tim_ri = #SongDetails.tim_ri# ,
          ri_tim = #SongDetails.ri_tim# ,
          tri_o_la = #SongDetails.tri_o_la#  ,
          ti_ti_ti = #SongDetails.ti_ti_ti# ,
          ta_ti = #SongDetails.ta_ti#  ,
          ti_ta = #SongDetails.ti_ta# ,
          tai = #SongDetails.tai#,
          tim_ri_ti = #SongDetails.tim_ri_ti# ,
          ri_tim_ti = #SongDetails.ri_tim_ti#  ,
          ti_tim_ri = #SongDetails.ti_tim_ri# ,
          tie = #SongDetails.tie# ,
          other_other = #SongDetails.other_other#  ,
          Anac = #SongDetails.Anac#  ,
          Ri = #SongDetails.Ri# ,
          Tim = #SongDetails.Tim#  ,
          ri_tim_ri = #SongDetails.ri_tim_ri# ,
          IP_Status = #SongDetails.IP_Status#  ,
          Proofed_Flag = #SongDetails.Proofed_Flag# ,
          LoC = #SongDetails.LoC# ,
          Child = #SongDetails.Child#,
          Grade_String =  '#SongDetails.Grade_String#',
          Song_Background = '#SongDetails.Song_Background#',
          Game = #SongDetails.Game#
          where ID = #SongDetails.ID#
          select 1
</cfquery>
<cfreturn editSong>
</cffunction>

<cffunction name="deleteSong" access="remote" returntype="any">
<cfargument name="ID" type="numeric" required="yes">
<cfquery name="delete" datasource="kodaly">
delete from tbl_Titles where id = #ID#
select 1
</cfquery>
<cfreturn delete>
</cffunction>


</cfcomponent>