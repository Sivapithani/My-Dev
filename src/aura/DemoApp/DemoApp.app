<aura:application access="GLOBAL" extends="ltng:outApp">

   <!-- <c:Updateoppty /> 
	 <lightning:tabset>
        <lightning:tab label="Item One">
            Sample Content One
        </lightning:tab>
        <lightning:tab label="Item Two">
            Sample Content Two
        </lightning:tab>
         <lightning:tab label="Item Two">
            Sample Content Three
        </lightning:tab>
         <lightning:tab label="Item Two">
            Sample Content Four
        </lightning:tab>
    </lightning:tabset>  
    <lightning:buttonMenu iconName="utility:settings" alternativeText="Settings" onselect="{! c.handleMenuSelect }">
    <lightning:menuItem label="Font" value="font" />
    <lightning:menuItem label="Size" value="size"/>
    <lightning:menuItem label="Format" value="format" />
</lightning:buttonMenu> 
    <lightning:breadcrumbs>
        <lightning:breadcrumb label="Parent Account" href="path/to/place/1"/>
        <lightning:breadcrumb label="Case" href="path/to/place/2"/>
    </lightning:breadcrumbs> 
    
     <aura:handler name="init" value="{!this}" action="{!c.doInit}" />
    <aura:attribute name="items" type="Object"/>
    <lightning:tree items="{! v.items }" header="Roles"/>  
    <lightning:listView aura:id="listViewAccounts"
    objectApiName="Account"
    listName="My_Accounts"
    rows="5"
    showActionBar="false"
    enableInlineEdit="true"
    showRowLevelActions="false"
/> 
    
    
    <aura:attribute name="statusOptions" type="List" default="[]"/>
    <aura:handler name="init" value="{! this }" action="{! c.loadOptions }"/>
    <lightning:combobox aura:id="selectItem" name="status" label="Status"
                      placeholder="Choose Status"
                      value="new"
                      onchange="{!c.handleChange}"
                      options="{!v.statusOptions}"/>  
    <aura:attribute name="listOptions" type="List" default="[]"/>
    <aura:attribute name="defaultOptions" type="List" default="[]"/>
    <aura:attribute name="requiredOptions" type="List" default="[]"/>
    <aura:handler name="init" value="{! this }" action="{! c.initialize }"/>
    <lightning:dualListbox aura:id="selectOptions" name="Select Options"  label= "Select Options" 
                           sourceLabel="Available Options" 
                           selectedLabel="Selected Options" 
                           options="{! v.listOptions }"
                           value="{! v.defaultOptions }"
                           requiredOptions="{! v.requiredOptions }"
                           onchange="{! c.handleChange }"/>
    
    <lightning:card >
<aura:set attribute="title">My Account</aura:set>
<aura:set attribute="footer">Footer</aura:set>
<aura:set attribute="actions">
<lightning:button label="New"/>
</aura:set>
<p class="slds-p-horizontal_small">
Card Body
</p>
</lightning:card>
    
    <lightning:card >
<aura:set attribute="title">My Account</aura:set>
<aura:set attribute="footer">Footer</aura:set>
<aura:set attribute="actions">
<lightning:button label="New"/>
</aura:set>
<div class="slds-card__body_inner">
Card Body
</div>
</lightning:card>
    <lightning:layout horizontalAlign="space" class="slds-grid_reverse">
<lightning:layoutItem padding="around-small"> more markup here 
</lightning:layoutItem>
 more lightning:layoutItem components here 
</lightning:layout>
    
 
<ul class="slds-has-dividers_around-space">

 
<li class="slds-item">
<lightning:tile label="Anypoint Connectors" href="/path/to/somewhere"
class="slds-tile_board">
<p class="slds-text-heading_medium">$500,000</p>
<p class="slds-truncate" title="Company One"><a href="#">Company One</a></p>
<p class="slds-truncate">Closing 9/30/2015</p>
</lightning:tile>
</li>
</ul>  
    <ui:menu >
        <ui:menuTriggerLink aura:id="trigger" label="Opportunity Status"/>
        <ui:menuList class="actionMenu" aura:id="actionMenu">
            <ui:actionMenuItem aura:id="item2" label="Open"
                               click="{!c.updateTriggerLabel}"/>
            <ui:actionMenuItem aura:id="item3" label="Closed"
                               click="{!c.updateTriggerLabel}"/>
            <ui:actionMenuItem aura:id="item4" label="Closed Won"
                               click="{!c.updateTriggerLabel}"/>
        </ui:menuList>
    </ui:menu>
    <c:aok_cmp_LightningWizard/>
     <ltng:require styles="{!$Resource.SLDS100 +
         '/assets/styles/salesforce-lightning-design-system-ltng.css'}"/>
    <div class="slds">
       <c:RecordViewComponent/>  
    </div>
    <ltng:require styles="{!$Resource.SLDS100 +
         '/assets/styles/salesforce-lightning-design-system-ltng.css'}"/>
    <div class="slds">
<c:ContactList_cmp></c:ContactList_cmp>

   <c:FieldSetComponentv1 />-->
    
</aura:application>