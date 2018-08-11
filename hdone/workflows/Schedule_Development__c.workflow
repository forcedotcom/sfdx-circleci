<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>MonthNumUpdate</fullName>
        <description>Updates Month Number</description>
        <field>MonthNum__c</field>
        <formula>CASE( Month__c , &quot;January&quot;, 1, 
&quot;February&quot;, 2,
&quot;March&quot;, 3,
&quot;April&quot;, 4,
&quot;May&quot;, 5,
&quot;June&quot;, 6,
&quot;July&quot;, 7,
&quot;August&quot;, 8,
&quot;September&quot;, 9,
&quot;October&quot;, 10,
&quot;November&quot;, 11,
&quot;December&quot;, 12,
0)</formula>
        <name>MonthNumUpdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
