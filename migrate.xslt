<?xml version="1.0"?>
<!--
  Copyright 2010-2013 the original author or authors.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:java="http://xml.apache.org/xslt/java">
<xsl:output method="xml" encoding="UTF-8" />

<xsl:template match="/sqlMapConfig">
<xsl:comment>Converted at: <xsl:value-of select="string(java:java.util.Date.new())"/> </xsl:comment>
<xsl:text disable-output-escaping="yes"><![CDATA[
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD SQL Map Config 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-config.dtd">
]]></xsl:text>
<xsl:element name="configuration">
  	<xsl:apply-templates select="/sqlMapConfig/settings"/>
	<xsl:text>
	</xsl:text>
  	<xsl:element name="typeAliases">
		<xsl:text>
		</xsl:text>
  		<xsl:for-each select="/sqlMapConfig/typeAlias">
			<xsl:copy-of select="."/>
			<xsl:text>
			</xsl:text>
 		</xsl:for-each>
  	</xsl:element>
	<xsl:text>
	
	</xsl:text>
  	<xsl:element name="typeHandlers">
		<xsl:text>
		</xsl:text>
  		<xsl:for-each select="/sqlMapConfig/typeHandler">
			<xsl:element name="typeHandler">
				<xsl:attribute name="javaType"><xsl:value-of select="@javaType"/></xsl:attribute>
				<xsl:attribute name="jdbcType"><xsl:value-of select="@jdbcType"/></xsl:attribute>
				<xsl:attribute name="handler"><xsl:value-of select="@callback"/></xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
 		</xsl:for-each>
  	</xsl:element>
	<xsl:text>
	
	</xsl:text>
	
	<xsl:if test="resultObjectFactory">
		<xsl:element name="objectFactory">
			<xsl:attribute name="type"><xsl:value-of select="resultObjectFactory/@type"/></xsl:attribute>
		</xsl:element>
		<xsl:text>
		
		</xsl:text>
	</xsl:if>
	
	<xsl:if test="transactionManager">
  	<xsl:element name="environments"><xsl:attribute name="default">default</xsl:attribute>
		<xsl:text>
		</xsl:text>
  		<xsl:element name="environment"><xsl:attribute name="id">default</xsl:attribute>
			<xsl:text>
			</xsl:text>
  			<xsl:element name="transactionManager"><xsl:attribute name="type"><xsl:value-of select="transactionManager/@type"/></xsl:attribute>
		  		<xsl:for-each select="transactionManager/property">
					<xsl:text>
					</xsl:text>
					<xsl:copy-of select="."/>
		 		</xsl:for-each>
				<xsl:text>
				</xsl:text>
  			</xsl:element>
			<xsl:text>
			</xsl:text>
 			<xsl:if test="transactionManager/dataSource">
				<xsl:text>
				</xsl:text>
 				<xsl:element name="dataSource">
 					<xsl:attribute name="type"><xsl:value-of select="transactionManager/dataSource/@type"/></xsl:attribute>
			  		<xsl:for-each select="transactionManager/dataSource/property">
						<xsl:text>
						</xsl:text>
						<xsl:copy-of select="."/>
			 		</xsl:for-each>
					<xsl:text>
					</xsl:text>
 				</xsl:element>
				<xsl:text>
				</xsl:text>
 			</xsl:if>
		</xsl:element>
		<xsl:text>
		</xsl:text>
	</xsl:element>
	<xsl:text>
	
	</xsl:text>
	</xsl:if>	
	
  	<xsl:element name="mappers">
		<xsl:text>
		</xsl:text>
  		<xsl:for-each select="/sqlMapConfig/sqlMap">
			<xsl:element name="mapper">
				<xsl:copy-of select="@*"/>
			</xsl:element>
			<xsl:text>
			</xsl:text>
 		</xsl:for-each>
  	</xsl:element>
	<xsl:text>
	</xsl:text>
</xsl:element>
</xsl:template>

<xsl:template match="/sqlMapConfig/settings">
	<xsl:element name="settings">
		<xsl:text>
		</xsl:text>
		<xsl:if test="@cacheModelsEnabled">
			<xsl:element name="setting">
  				<xsl:attribute name="name">cacheEnabled</xsl:attribute>
  				<xsl:attribute name="value"><xsl:value-of select="@cacheModelsEnabled" /></xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
		</xsl:if>
		<xsl:if test="@statementCachingEnabled='true'">
			<xsl:element name="setting">
  				<xsl:attribute name="name">defaultExecutorType</xsl:attribute>
  				<xsl:attribute name="value">REUSE</xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
		</xsl:if>
		<xsl:if test="@lazyLoadingEnabled">
			<xsl:element name="setting">
  				<xsl:attribute name="name">lazyLoadingEnabled</xsl:attribute>
  				<xsl:attribute name="value"><xsl:value-of select="@lazyLoadingEnabled" /></xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
		</xsl:if>
		<xsl:if test="@defaultStatementTimeout">
			<xsl:element name="setting">
  				<xsl:attribute name="name">defaultStatementTimeout</xsl:attribute>
  				<xsl:attribute name="value"><xsl:value-of select="@defaultStatementTimeout" /></xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
		</xsl:if>
		<xsl:if test="@forceMultipleResultSetSupport">
			<xsl:element name="setting">
  				<xsl:attribute name="name">multipleResultSetsEnabled</xsl:attribute>
  				<xsl:attribute name="value"><xsl:value-of select="@forceMultipleResultSetSupport" /></xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
		</xsl:if>
		<xsl:if test="@useColumnLabel">
			<xsl:element name="setting">
  				<xsl:attribute name="name">useColumnLabel</xsl:attribute>
  				<xsl:attribute name="value"><xsl:value-of select="@useColumnLabel" /></xsl:attribute>
			</xsl:element>
			<xsl:text>
			</xsl:text>
		</xsl:if>
	</xsl:element>
</xsl:template>






<xsl:template match="/sqlMap">
<xsl:comment>Converted at: <xsl:value-of select="string(java:java.util.Date.new())"/> </xsl:comment>
<xsl:text disable-output-escaping="yes"><![CDATA[
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
]]></xsl:text>
<xsl:element name="mapper">
	<xsl:attribute name="namespace"><xsl:value-of select="@namespace" /></xsl:attribute>
  	<xsl:apply-templates/>
</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/select">
	<xsl:element name="select">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@parameterClass">
			<xsl:attribute name="parameterType"><xsl:value-of select="@parameterClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@parameterMap">
			<xsl:attribute name="parameterMap"><xsl:value-of select="@parameterMap" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@resultClass">
			<xsl:attribute name="resultType"><xsl:value-of select="@resultClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@resultMap">
			<xsl:attribute name="resultMap"><xsl:value-of select="@resultMap" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@fetchSize">
			<xsl:attribute name="fetchSize"><xsl:value-of select="@fetchSize" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@resultSetType">
			<xsl:attribute name="resultSetType"><xsl:value-of select="@resultSetType" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@timeout">
			<xsl:attribute name="timeout"><xsl:value-of select="@timeout" /></xsl:attribute>
		</xsl:if>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/insert">
	<xsl:element name="insert">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@parameterClass">
			<xsl:attribute name="parameterType"><xsl:value-of select="@parameterClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@parameterMap">
			<xsl:attribute name="parameterMap"><xsl:value-of select="@parameterMap" /></xsl:attribute>
		</xsl:if>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/update">
	<xsl:element name="update">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@parameterClass">
			<xsl:attribute name="parameterType"><xsl:value-of select="@parameterClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@parameterMap">
			<xsl:attribute name="parameterMap"><xsl:value-of select="@parameterMap" /></xsl:attribute>
		</xsl:if>
   	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/procedure">
	<xsl:element name="update">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@parameterClass">
			<xsl:attribute name="parameterType"><xsl:value-of select="@parameterClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@parameterMap">
			<xsl:attribute name="parameterMap"><xsl:value-of select="@parameterMap" /></xsl:attribute>
		</xsl:if>
		<xsl:attribute name="statementType">CALLABLE</xsl:attribute>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/delete">
	<xsl:element name="delete">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@parameterClass">
			<xsl:attribute name="parameterType"><xsl:value-of select="@parameterClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@parameterMap">
			<xsl:attribute name="parameterMap"><xsl:value-of select="@parameterMap" /></xsl:attribute>
		</xsl:if>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/resultMap">
	<xsl:element name="resultMap">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@class">
			<xsl:attribute name="type"><xsl:value-of select="@class" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@extends">
			<xsl:attribute name="extends">
				<xsl:value-of select="@extends" />
			</xsl:attribute>
		</xsl:if>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/resultMap/discriminator">
	<xsl:element name="discriminator">
		<xsl:attribute name="javaType"><xsl:value-of select="@javaType" /></xsl:attribute>
		<xsl:if test="@column">
			<xsl:attribute name="column"><xsl:value-of select="@column" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@jdbcType">
			<xsl:attribute name="jdbcType"><xsl:value-of select="@jdbcType" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@typeHandler">
			<xsl:attribute name="typeHandler"><xsl:value-of select="@typeHandler" /></xsl:attribute>
		</xsl:if>
  	<xsl:apply-templates/>
	</xsl:element>
</xsl:template>
  	
<xsl:template match="/sqlMap/resultMap/discriminator/subMap">
	<xsl:element name="case">
		<xsl:attribute name="value"><xsl:value-of select="@value" /></xsl:attribute>
		<xsl:attribute name="resultMap"><xsl:value-of select="@resultMap" /></xsl:attribute>
	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/parameterMap">
	<xsl:element name="parameterMap">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
		<xsl:if test="@class">
			<xsl:attribute name="type"><xsl:value-of select="@class" /></xsl:attribute>
		</xsl:if>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="/sqlMap/parameterMap/parameter">
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="/sqlMap/resultMap/result">
	<xsl:if test="@nullValue">
		<xsl:message>Sorry, I can`t migrate nullValue in: <xsl:copy-of select="." /></xsl:message>
	</xsl:if>
	<xsl:if test="@columnIndex">
		<xsl:message>Sorry, I can`t migrate columnIndex in: <xsl:copy-of select="." /></xsl:message>
	</xsl:if>
	<xsl:if test="@notNullColumn">
		<xsl:message>Sorry, I can`t migrate notNullColumn in: <xsl:copy-of select="." /></xsl:message>
	</xsl:if>
	<xsl:choose>
	<xsl:when test="@resultMap">
		<xsl:element name="collection">
			<xsl:attribute name="property"><xsl:value-of select="@property" /></xsl:attribute>
			<xsl:attribute name="resultMap"><xsl:value-of select="@resultMap" /></xsl:attribute>
		</xsl:element>
	</xsl:when>
	<xsl:when test="@select">
		<xsl:element name="association">
			<xsl:attribute name="property"><xsl:value-of select="@property" /></xsl:attribute>
			<xsl:attribute name="select"><xsl:value-of select="@select" /></xsl:attribute>
			<xsl:if test="@column">
				<xsl:attribute name="column"><xsl:value-of select="@column" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@javaType">
				<xsl:attribute name="javaType"><xsl:value-of select="@javaType" /></xsl:attribute>
			</xsl:if>
		</xsl:element>
	</xsl:when>
	<xsl:otherwise>
	<xsl:element name="result">
		<xsl:if test="@property">
			<xsl:attribute name="property"><xsl:value-of select="@property" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@column">
			<xsl:attribute name="column"><xsl:value-of select="@column" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@javaType">
			<xsl:attribute name="javaType"><xsl:value-of select="@javaType" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@jdbcType">
			<xsl:attribute name="jdbcType"><xsl:value-of select="@jdbcType" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@typeHandler">
			<xsl:attribute name="typeHandler"><xsl:value-of select="@typeHandler" /></xsl:attribute>
		</xsl:if>
	</xsl:element>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="/sqlMap/sql">
	<xsl:element name="sql">
		<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
  	<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="include">
	<xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="isNull">
	<xsl:element name="if">
		<xsl:attribute name="test">
		<xsl:if test="substring-before(@property, '.')">
			<xsl:value-of select="substring-before(@property, '.')" /><xsl:text> == null or </xsl:text>
		</xsl:if>
		<xsl:value-of select="@property" /><xsl:text> == null</xsl:text></xsl:attribute>
		<xsl:value-of select="@prepend" />
  		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isNotNull">
	<xsl:element name="if">
		<xsl:attribute name="test">
		<xsl:if test="substring-before(@property, '.')">
			<xsl:value-of select="substring-before(@property, '.')" /><xsl:text> != null and </xsl:text>
		</xsl:if>
		<xsl:value-of select="@property" /><xsl:text> != null</xsl:text></xsl:attribute>
		<xsl:value-of select="@prepend" />
  		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isNotEmpty">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:if test="substring-before(@property, '.')">
				<xsl:value-of select="substring-before(@property, '.')" /><xsl:text> != null and </xsl:text>
			</xsl:if>
			<xsl:value-of select="@property" /><xsl:text> != null and </xsl:text>
			<xsl:value-of select="@property" /><xsl:text> != ''</xsl:text>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
  		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isEmpty">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:if test="substring-before(@property, '.')">
				<xsl:value-of select="substring-before(@property, '.')" /><xsl:text> != null and </xsl:text>
			</xsl:if>
			<xsl:value-of select="@property" /><xsl:text> == null or </xsl:text>
			<xsl:value-of select="@property" /><xsl:text> == ''</xsl:text>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
  		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isGreaterThan">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:value-of select="@property" />
			<xsl:text><![CDATA[ > ]]></xsl:text>
			<xsl:value-of select="@compareProperty" />
			<xsl:choose>
				<xsl:when test="number(@compareValue) &gt; '-999999999'">
					<xsl:value-of select="@compareValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text><![CDATA["]]></xsl:text><xsl:value-of select="@compareValue" /><xsl:text><![CDATA["]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isLessThan">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:value-of select="@property" />
			<xsl:text><![CDATA[ < ]]></xsl:text>
			<xsl:value-of select="@compareProperty" />
			<xsl:choose>
				<xsl:when test="number(@compareValue) &gt; '-999999999'">
					<xsl:value-of select="@compareValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text><![CDATA["]]></xsl:text><xsl:value-of select="@compareValue" /><xsl:text><![CDATA["]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isEqual">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:if test="substring-before(@property, '.')">
				<xsl:value-of select="substring-before(@property, '.')" /><xsl:text> != null and </xsl:text>
			</xsl:if>
			<xsl:value-of select="@property" />
			<xsl:text><![CDATA[ == ]]></xsl:text>
			<xsl:value-of select="@compareProperty" />
			<xsl:choose>
				<xsl:when test="number(@compareValue) &gt; '-999999999'">
					<xsl:value-of select="@compareValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text><![CDATA["]]></xsl:text><xsl:value-of select="@compareValue" /><xsl:text><![CDATA["]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="isNotEqual">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:if test="substring-before(@property, '.')">
				<xsl:value-of select="substring-before(@property, '.')" /><xsl:text> != null and </xsl:text>
			</xsl:if>
			<xsl:value-of select="@property" />
			<xsl:text><![CDATA[ != ]]></xsl:text>
			<xsl:value-of select="@compareProperty" />
			<xsl:choose>
				<xsl:when test="number(@compareValue) &gt; '-999999999'">
					<xsl:value-of select="@compareValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text><![CDATA["]]></xsl:text><xsl:value-of select="@compareValue" /><xsl:text><![CDATA["]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>

<xsl:template match="isLessEqual">
	<xsl:element name="if">
		<xsl:attribute name="test">
			<xsl:value-of select="@property" />
			<xsl:text><![CDATA[ <= ]]></xsl:text>
			<xsl:value-of select="@compareProperty" />
			<xsl:choose>
				<xsl:when test="number(@compareValue) &gt; '-999999999'">
					<xsl:value-of select="@compareValue" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text><![CDATA["]]></xsl:text><xsl:value-of select="@compareValue" /><xsl:text><![CDATA["]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<xsl:value-of select="@prepend" />
		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="iterate">
	<xsl:value-of select="@prepend" /><xsl:text> </xsl:text>
	<xsl:element name="foreach">
		<xsl:attribute name="collection"><xsl:value-of select="@property" /></xsl:attribute>
		<xsl:attribute name="item">item</xsl:attribute>
		<xsl:if test="@conjunction">
			<xsl:attribute name="separator"><xsl:value-of select="@conjunction" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@close">
			<xsl:attribute name="close"><xsl:value-of select="@close" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@open">
			<xsl:attribute name="open"><xsl:value-of select="@open" /></xsl:attribute>
		</xsl:if>
  		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="selectKey">
	<xsl:element name="selectKey">
		<xsl:attribute name="keyProperty"><xsl:value-of select="@keyProperty" /></xsl:attribute>
		<xsl:if test="@resultClass">
			<xsl:attribute name="resultType"><xsl:value-of select="@resultClass" /></xsl:attribute>
		</xsl:if>
		<xsl:if test="@type = 'pre'">
			<xsl:attribute name="order">BEFORE</xsl:attribute>
		</xsl:if>
		<xsl:if test="@type = 'post'">
			<xsl:attribute name="order">AFTER</xsl:attribute>
		</xsl:if>
  		<xsl:apply-templates/>
  	</xsl:element>
</xsl:template>

<xsl:template match="comment()">
	<xsl:copy/>
</xsl:template>

<xsl:template match="/sqlMap/typeAlias|statement|cacheModel|dynamic|isPropertyAvailable|isNotPropertyAvailable|isNotParameterPresent|isParameterPresent|/sqlMapConfig/properties">
	<xsl:comment>
		Sorry, I can`t migrate	<xsl:value-of select="@*"/>
		See console output for further details 
	</xsl:comment>
	<xsl:message >
		Sorry, I can`t migrate:
<xsl:copy-of select="."/>
	</xsl:message> 
</xsl:template>

</xsl:stylesheet>
