<%@page contentType="text/html;charset=ISO-8859-9"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
        <title>3D Model</title>
    </head>
    <body>
    <%
        
        //  AŞAĞIDA 3D SECURE İŞLEMİ İÇİN GEREKLİ ALANLAR VE KULLANIMLARI İLE JAVA KOD ÖRNEĞİ VERİLMİŞTİR. GİRİLEN DEĞERLER TEST AMAÇLI GİRİLMİŞTİR.
        //  3D MODEL ÜZERİNE DÜZENLENMİŞ KOD ÖRNEĞİDİR. İŞ YERLERİ KENDİ DEĞERLERİYLE DEĞİŞKENLERİ TANIMLAMALIDIR. 
        //  İŞ YERLERİNE REFERANS AMAÇLI OLUŞTURULMUŞTUR.
        
        
        
        
        
        /* 3D secure için gerekli alanlar 3d modelinde aşağıdaki alanlar ile birlikte formda yollanan alanlardır. 
        * Form dışındaki alanların hidden text olarak post gerekmektedir. */
        
        
        /*******************      GEREKLİ ALANLAR (İşyeri tarafından doldurulması gereken)       ******************************/
        String clientId = "230010000";     //Banka tarafından verilen işyeri numarası
        String amount = "9.95";       //İşlem tutarı
        String oid = "";       //Sipariş numarası
        String okUrl = "http://localhost:8080/basicWeb/odemesayfasi.jsp";   //İşlem başarılıysa dönülecek işyeri sayfası  (3D işleminin sonucu ödeme işleminin değil)
        String failUrl = "http://localhost:8080/basicWeb/odemesayfasi.jsp"; //İşlem başarısız ise dönülecek işyeri sayfası(3D işleminin sonucu ödeme işleminin değil)
        String rnd = new java.util.Date().toString(); // Tarih veya her seferinde değişen bir değer güvenlik amaçlı kullanılıyor
        
        String storekey="LONDON1234";       //İşyeri ayıracı (işyeri anahtarı)
        
        String firmaadi = "xfirma";     //Firmanın gösterilen adı
        
        String storetype="3d";          //3D modeli 
        
        // 3D modelinde hash hesaplamasında işlem tipi ve taksit kullanılmıyor
        
        String hashstr = clientId + oid + amount + okUrl + failUrl + rnd + storekey;
        java.security.MessageDigest sha1 = java.security.MessageDigest.getInstance("SHA-1");
        
        String hash = (new sun.misc.BASE64Encoder()).encode(sha1.digest(hashstr.getBytes())); // Güvenlik kontrolu için üretilen SHA1 değeri
        
        /***************       GEREKLİ ALANLAR          ********************************/
        
        
        
        
        
        
       
        
        
        // İsteğe bağlı alanlarda işyeri tarafından eğer gerekli görülürse gerekli alanlara ilave olarak form ile birlikte post edilmelidir.  
        
    
        /***************       ISTEĞE BAĞLI ALANLAR    *********************************/
        String description = ""; //Açıklama
        String xid = "";    //İşlem takip numarası 3D için XID i mağaza üretirse o kullanir, yoksa sistem üretiyor. (3D secure işlemleri için işlem takip numarası 20 bytelik bilgi 28 karaktere base64 olarak kodlanmalı, geçersiz yada boş ise sistem tarafından üretilir.)
        String lang="";     //gösterim dili boş ise Türkçe (tr), İngilizce için (en)
        String email="";    //email adresi
        String userid="";   //Kullanıcı takibi için id
        /***************       ISTEĞE BAĞLI ALANLAR     ********************************/
        
        
        
        
        //  FORMDA YER ALAN ALANLAR KART SAHİBİNİN KART BİLGİLERİNİ GİRDİĞİ GEREKLİ ALANLARDIR 
        
        
    %>
        <center>
            <form method="post" action="https://entegrasyon.asseco-see.com.tr/fim/est3Dgate">
                <table>
                    <tr>
                        <td>Kredi Kart Numarası:</td>
                        <td><input type="text" name="pan" size="20"/>
                    </tr>
                    
                    <tr>
                        <td>Güvenlik Kodu:</td>
                        <td><input type="text" name="cv2" size="4" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Son Kullanma Yılı:</td>
                        <td><input type="text" name="Ecom_Payment_Card_ExpDate_Year" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Son Kullanma Ayı:</td>
                        <td><input type="text" name="Ecom_Payment_Card_ExpDate_Month" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Visa/MC secimi</td>
                        <td><select name="cardType">
                            <option value="1">Visa</option>
                            <option value="2">MasterCard</option>
                        </select>
                    </tr>
                    
                    <tr>
                        <td align="center" colspan="2">
                            <input type="submit" value="Ödemeyi Tamamla"/>
                        </td>
                    </tr>
                    
                </table>
                <input type="hidden" name="clientid" value="<%=clientId%>">
                <input type="hidden" name="amount" value="<%=amount%>">
                <input type="hidden" name="oid" value="<%=oid%>">	
                <input type="hidden" name="okUrl" value="<%=okUrl%>">
                <input type="hidden" name="failUrl" value="<%=failUrl%>">
                <input type="hidden" name="rnd" value="<%=rnd%>" >
                <input type="hidden" name="hash" value="<%=hash%>" >
                
                <input type="hidden" name="storetype" value="3d" >		
                <input type="hidden" name="lang" value="tr">
				<input type="hidden" name="currency" value="949">
                
                
            </form>
            <br>
            <b>Kullanılan Hidden Parametreler</b>
            <br>
            
            &lt;input type="hidden" name="clientid" value=""&gt;<br>
                &lt;input type="hidden" name="amount" value=""&gt;<br>
                &lt;input type="hidden" name="oid" value=""&gt;	<br>
                &lt;input type="hidden" name="okUrl" value=""&gt;<br>
                &lt;input type="hidden" name="failUrl" value=""&gt;<br>
                &lt;input type="hidden" name="rnd" value="" &gt;<br>
                &lt;input type="hidden" name="hash" value="" &gt;<br>
                
                &lt;input type="hidden" name="storetype" value="" &gt;	<br>	
                &lt;input type="hidden" name="lang" value=""&gt;<br>
        </center>
    </body>
</html>
