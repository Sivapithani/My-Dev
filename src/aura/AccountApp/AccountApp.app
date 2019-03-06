<aura:application >
      <!--<c.NewAccount/> 
   <c:contactList ></c:contactList>
    <c:quickContact ></c:quickContact> 
    <c:DatatablewithFixedHeader />  
    <c:AccountTable /> 
    <lightning:tabset >
        <lightning:tab label="Tab 1">
            <aura:set attribute="body">
                Hello World!
            </aura:set>
        </lightning:tab>
</lightning:tabset>
    <lightning:tabset aura:id="tabs" selectedTabId="two">
        <lightning:tab label="Item One" id="one">
            Sample Content One
        </lightning:tab>
        <lightning:tab label="Item Two" id="two">
            Sample Content Two
        </lightning:tab>
        <lightning:tab label="Item Three" id="three">
            Sample Content Three
        </lightning:tab>
    </lightning:tabset> 
    <lightning:card class="slds-text-heading_small" title="Watchlist (0)" iconName="utility:broadcast">
      
    </lightning:card> 
    <lightning:layout horizontalAlign="space">
            <lightning:layoutItem flexibility="auto" padding="around-small">
                1
            </lightning:layoutItem>
            <lightning:layoutItem flexibility="auto" padding="around-small">
                2
            </lightning:layoutItem>
            <lightning:layoutItem flexibility="auto" padding="around-small">
                3
            </lightning:layoutItem>
            <lightning:layoutItem flexibility="auto" padding="around-small">
                4
            </lightning:layoutItem>
        </lightning:layout> -->
    <lightning:tabset >
        <lightning:tab label="Item One">
            Sample Content One
        </lightning:tab>
        <lightning:tab label="Item Two">
            Sample Content Two
        </lightning:tab>
    </lightning:tabset>
</aura:application>