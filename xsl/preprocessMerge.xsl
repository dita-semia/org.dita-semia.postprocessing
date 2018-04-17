<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl	= "http://www.w3.org/1999/XSL/Transform"
	xmlns:xs	= "http://www.w3.org/2001/XMLSchema" 
	xmlns:ds	= "http://www.dita-semia.org"
	exclude-result-prefixes="#all">
	
	
	<xsl:variable name="CLASS_TOPICREF"			as="xs:string"	select="' map/topicref '"/>
	
	
	<xsl:template match="text()[matches(., '^\s+$')]" priority="20">
		<xsl:variable name="isNextNodeFiltered" as="xs:boolean?">
			<xsl:apply-templates select="following-sibling::node()[1]" mode="isFiltered"/>
		</xsl:variable>
		<xsl:if test="not($isNextNodeFiltered)">
			<xsl:next-match/>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template match="node()" priority="10">
		<xsl:variable name="isFiltered" as="xs:boolean">
			<xsl:apply-templates select="." mode="isFiltered"/>
		</xsl:variable>
		<xsl:if test="not($isFiltered)">
			<xsl:next-match/>
		</xsl:if>
	</xsl:template>


	<xsl:template match="*[contains(@class, $CLASS_TOPICREF)][@href]">
		<xsl:copy>
			<xsl:apply-templates select="attribute() | node()" mode="#current"/>
			<xsl:variable name="refUri" as="xs:anyURI" select="resolve-uri(replace(@href, '\\', '/'), base-uri(.))"/>
			<xsl:if test="doc-available($refUri)">
				<xsl:apply-templates select="doc($refUri)" mode="#current"/>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	
	
	<xsl:template match="@xtrc | @xtrf">
		<!-- filter -->
	</xsl:template>
	
	
	<!-- default templates -->
	<xsl:template match="attribute() | node()">
		<xsl:copy>
			<xsl:apply-templates select="attribute() | node()" mode="#current"/>
		</xsl:copy>
	</xsl:template>


	<xsl:template match="processing-instruction('workdir') | processing-instruction('workdir-uri')" mode="isFiltered">
		<xsl:sequence select="true()"/>
	</xsl:template>
	
	
	<xsl:template match="node()" mode="isFiltered">
		<xsl:sequence select="false()"/>
	</xsl:template>
	
		
</xsl:stylesheet>
