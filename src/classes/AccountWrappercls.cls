public  class AccountWrappercls implements comparable{
  public Date createdDate {get;set;}
  public string num1 {get;set;}
  public String  name {get;set;}
  public static String sortableField='name';
  public static String sortOrder='asc';  
  public AccountWrappercls(Date createdDate,String  name,string num1){
      this.createdDate = createdDate;
      this.num1 = num1;
      this.name =name;
      //this.sortableField = sortableField;
      //this.sortOrder = sortOrder;
  }
   public  Integer compareTo(Object compareTo) {
     AccountWrappercls compWrap = (AccountWrappercls)compareTo;
     if(sortOrder == 'asc'){
    if(sortableField == 'num1'){     
            if (num1 == compWrap.num1) return 0;
          if (num1 > compWrap.num1) return 1;
          return -1;        
    }
    if(sortableField == 'name'){     
            if (name == compWrap.name) return 0;
          if (name > compWrap.name) return 1;
          return -1;        
    }
    if(sortableField == 'createdDate'){     
            if (createdDate == compWrap.createdDate) return 0;
          if (createdDate > compWrap.createdDate) return 1;
          return -1;        
    }}else{
      if(sortableField == 'num1'){     
            if (num1 == compWrap.num1) return 0;
          if (num1 > compWrap.num1) return -1;
          return 1;        
    }
    if(sortableField == 'name'){     
            if (name == compWrap.name) return 0;
          if (name > compWrap.name) return -1;
          return 1;        
    }
    if(sortableField == 'createdDate'){     
            if (createdDate == compWrap.createdDate) return 0;
          if (createdDate > compWrap.createdDate) return -1;
          return 1;        
    }
    }
    
    return null;
    }    
}