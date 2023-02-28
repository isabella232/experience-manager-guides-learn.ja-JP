<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
	<sch:title>Schematron 1</sch:title>
	<sch:pattern>
		<sch:rule context="map">
			<sch:assert test="count(topicref) > 0">There should be atleast one topicref in map</sch:assert>
		</sch:rule>
		<sch:rule context="title"> 
			<sch:assert test="b"> Bold must be there in <sch:name/> element</sch:assert> 
		</sch:rule>
		<sch:rule context="shortdesc">
			<sch:let name="characters" value="string-length(text())"/>
			<sch:assert test="$characters &lt; 500"> 
				You have <sch:value-of select="$characters"/> characters. Short Description characters should be less than 100.       
			</sch:assert>  
		</sch:rule>
		<sch:rule context="ul">
			<sch:assert test="count(li) > 1" >
				A list must have more than one item.
			</sch:assert>
		</sch:rule>
		<sch:rule context="image">
			<sch:let name="test" value="substring(@alt,string-length(@alt))"/>
			<sch:assert test="$test = '.'" >
				Alternate text for image must end with '.'
			</sch:assert>
		</sch:rule>  
	</sch:pattern>
	<sch:pattern>
		<sch:rule context="xref[contains(@href, 'http') or contains(@href, 'https')]">
			<sch:assert test="@scope = 'external' and @format = 'html'">
				All external xref links must be with scope='external' and format='html'
			</sch:assert>
		</sch:rule>
	</sch:pattern>
	<sch:pattern>
		<sch:rule context="topicref[contains(@href, 'http') or contains(@href, 'https')]">
			<sch:assert test="@scope = 'external' and @format = 'html'">
				All external topicref links must be with scope='external' and format='html'
			</sch:assert>
		</sch:rule>
	</sch:pattern>
</sch:schema>