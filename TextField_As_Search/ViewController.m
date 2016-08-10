//
//  ViewController.m
//  TextField_As_Search
//
//  Created by dharmesh on 8/8/16.
//  Copyright © 2016 com.dharmesh.zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *ArrCountryName,*ArrStateName;
    NSArray *searchArray;
    BOOL isSearchingNow,isF_textfield;
    NSMutableAttributedString *strTextForColor;
    NSString *colorString;
    BOOL isBackSpacePressed;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isBackSpacePressed=false;
    self.view_out.hidden = YES;
    strTextForColor = [NSMutableAttributedString new];
    
    ArrCountryName = [[NSMutableArray alloc]initWithObjects:@"Afghanistan", @"Akrotiri", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola", @"Anguilla", @"Antarctica", @"Antigua and Barbuda", @"Argentina", @"Armenia", @"Aruba", @"Ashmore and Cartier Islands", @"Australia", @"Austria", @"Azerbaijan", @"The Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Bassas da India", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bermuda", @"Bhutan", @"Bolivia", @"Bosnia and Herzegovina", @"Botswana", @"Bouvet Island", @"Brazil", @"British Indian Ocean Territory", @"British Virgin Islands", @"Brunei", @"Bulgaria", @"Burkina Faso", @"Burma", @"Burundi", @"Cambodia", @"Cameroon", @"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Christmas Island", @"Clipperton Island", @"Cocos (Keeling) Islands", @"Colombia", @"Comoros", @"Democratic Republic of the Congo", @"Republic of the Congo", @"Cook Islands", @"Coral Sea Islands", @"Costa Rica", @"Cote d'Ivoire", @"Croatia", @"Cuba", @"Cyprus", @"Czech Republic", @"Denmark", @"Dhekelia", @"Djibouti", @"Dominica", @"Dominican Republic", @"Ecuador", @"Egypt", @"El Salvador", @"Equatorial Guinea", @"Eritrea", @"Estonia", @"Ethiopia", @"Europa Island", @"Falkland Islands (Islas Malvinas)", @"Faroe Islands", @"Fiji", @"Finland", @"France", @"French Guiana", @"French Polynesia", @"French Southern and Antarctic Lands", @"Gabon", @"The Gambia", @"Gaza Strip", @"Georgia", @"Germany", @"Ghana", @"Gibraltar", @"Glorioso Islands", @"Greece", @"Greenland", @"Grenada", @"Guadeloupe", @"Guam", @"Guatemala", @"Guernsey", @"Guinea", @"Guinea-Bissau", @"Guyana", @"Haiti", @"Heard Island and McDonald Islands", @"Holy See (Vatican City)", @"Honduras", @"Hong Kong", @"Hungary", @"Iceland", @"India", @"Indonesia", @"Iran", @"Iraq", @"Ireland", @"Isle of Man", @"Israel", @"Italy", @"Jamaica", @"Jan Mayen", @"Japan", @"Jersey", @"Jordan", @"Juan de Nova Island", @"Kazakhstan", @"Kenya", @"Kiribati", @"North Korea", @"South Korea", @"Kuwait", @"Kyrgyzstan", @"Laos", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libya", @"Liechtenstein", @"Lithuania", @"Luxembourg", @"Macau", @"Macedonia", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Marshall Islands", @"Martinique", @"Mauritania", @"Mauritius", @"Mayotte", @"Mexico", @"Federated States of Micronesia", @"Moldova", @"Monaco", @"Mongolia", @"Montserrat", @"Morocco", @"Mozambique", @"Namibia", @"Nauru", @"Navassa Island", @"Nepal", @"Netherlands", @"Netherlands Antilles", @"New Caledonia", @"New Zealand", @"Nicaragua", @"Niger", @"Nigeria", @"Niue", @"Norfolk Island", @"Northern Mariana Islands", @"Norway", @"Oman", @"Pakistan", @"Palau", @"Panama", @"Papua New Guinea", @"Paracel Islands", @"Paraguay", @"Peru", @"Philippines", @"Pitcairn Islands", @"Poland", @"Portugal", @"Puerto Rico", @"Qatar", @"Reunion", @"Romania", @"Russia", @"Rwanda", @"Saint Helena", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Pierre and Miquelon", @"Saint Vincent and the Grenadines", @"Samoa", @"San Marino", @"Sao Tome and Principe", @"Saudi Arabia", @"Senegal", @"Serbia", @"Montenegro", @"Seychelles", @"Sierra Leone", @"Singapore", @"Slovakia", @"Slovenia", @"Solomon Islands", @"Somalia", @"South Africa", @"South Georgia and the South Sandwich Islands", @"Spain", @"Spratly Islands", @"Sri Lanka", @"Sudan", @"Suriname", @"Svalbard", @"Swaziland", @"Sweden", @"Switzerland", @"Syria", @"Taiwan", @"Tajikistan", @"Tanzania", @"Thailand", @"Tibet", @"Timor-Leste", @"Togo", @"Tokelau", @"Tonga", @"Trinidad and Tobago", @"Tromelin Island", @"Tunisia", @"Turkey", @"Turkmenistan", @"Turks and Caicos Islands", @"Tuvalu", @"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"Uruguay", @"Uzbekistan", @"Vanuatu", @"Venezuela", @"Vietnam", @"Virgin Islands", @"Wake Island", @"Wallis and Futuna", @"West Bank", @"Western Sahara", @"Yemen", @"Zambia", @"Zimbabwe", nil];
    
    
    
    ArrStateName = [[NSMutableArray alloc]initWithObjects:@"ArunachalPradesh",@"Andhra Pradesh",@"Assam",@"Bihar",@"Chhattisgarh",@"Goa",@"Gujarat",@"Haryana",@"Himachal Pradesh",@"Jammu and Kashmir",@"Jharkhand",@"Karnataka",@"Kerala",@"Madhya Pradesh",@"Maharashtra",@"Manipur",@"Meghalaya",@"Mizoram",@"Nagaland",@"Odisha",@"Punjab",@"Rajasthan",@"Sikkim",@"Tamil Nadu",@"Telangana",@"Tripura",@"Uttar Pradesh",@"Uttarakhand",@"West Bengal",nil];
               

    
    self.txt_con_name.tag = 1;
    self.txt_name.tag = 0;
    
    
    self.txt_name.delegate =self;
    self.txt_con_name.delegate=self;
    self.tableview_out.delegate = self;
    self.tableview_out.dataSource = self;
    
    
    [self.tableview_out reloadData];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn_can:(id)sender
{
    self.txt_name.text=@"";
    ArrStateName=nil;
    [self.tableview_out reloadData];
    self.view_out.hidden=TRUE;
}
- (IBAction)btn_cancel:(id)sender
{
    self.txt_con_name.text=@"";
    ArrCountryName=nil;
    [self.tableview_out reloadData];
    self.view_out.hidden=TRUE;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(isSearchingNow)
        return searchArray.count;
    else
    {
        if (searchArray.count==0) {
            return 0;
        }
        else
        {
            return ArrStateName.count;
        }
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableview_out dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.layer.backgroundColor = [UIColor whiteColor].CGColor;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.highlightedTextColor = [UIColor orangeColor];

    if(isSearchingNow)
    {
        
        cell.textLabel.text = [searchArray objectAtIndex:indexPath.row];

       strTextForColor =  [self getAttributeText:cell.textLabel.text forSubstring:colorString];
        
        [cell.textLabel setAttributedText: strTextForColor];
        
    }
    else{
        cell.textLabel.text = [ArrStateName objectAtIndex:indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *selectedcell=(UITableViewCell *)[self.tableview_out cellForRowAtIndexPath:indexPath];
    if (isF_textfield) {
         self.txt_name.text = selectedcell.textLabel.text;
    }
    else{
          self.txt_con_name.text = selectedcell.textLabel.text;
    }
    self.view_out.hidden = YES;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor orangeColor];
    return indexPath;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor blackColor];
    return indexPath;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(isBackSpacePressed)
    colorString = textField.text;
    
    return true;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField.tag == 0)
    {
        isF_textfield = TRUE;
    }
    else
    {
        isF_textfield = FALSE;
    }
    self.view_out.hidden = NO;
    if([string isEqualToString:@""])
        isBackSpacePressed=true;
    else
        isBackSpacePressed=false;
    NSCharacterSet *charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@"()   ;    ^^ ?? ? // [{]}+=_-* / ,' \\  \" ^#`<>| ^  % : @ @@"];
    NSString *str1 = [textField.text stringByTrimmingCharactersInSet:charsToTrim];
     NSMutableString *someString= [NSMutableString stringWithString:str1];
    [someString appendString: string];
    
    colorString = someString;
    NSString *strSearch1 = [someString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",strSearch1];
 
    
    NSArray *filteredArray;
    if(textField==self.txt_con_name)
    {
        filteredArray= [ArrCountryName filteredArrayUsingPredicate:resultPredicate];
    }
    else
    {
        filteredArray= [ArrStateName filteredArrayUsingPredicate:resultPredicate];
    }
    searchArray = nil;
    searchArray = filteredArray;
    
    if(searchArray.count>0)
        isSearchingNow=true;
    else
        isSearchingNow=false;
    if (string.length == 0 && textField.text.length == 1)
    {
        [_tableview_out reloadData];
        self.view_out.hidden = YES;
    }
    [self.tableview_out reloadData];
    return TRUE;
}
-(NSMutableAttributedString*)getAttributeText:(NSString*)string forSubstring:(NSString*)searchstring {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:string];
   
        
    NSRange searchRange = NSMakeRange(0,string.length);
    for (NSInteger charIdx=0; charIdx<searchstring.length; charIdx++){
        NSString *substring = [searchstring substringWithRange:NSMakeRange(charIdx, 1)];
        NSRange foundRange;
        searchRange.location = 0;
        while (searchRange.location < string.length)
        {
            searchRange.length = string.length-searchRange.location;
            foundRange = [string rangeOfString:substring options:1 range:searchRange];
            [text addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range:foundRange];
            if (foundRange.location != NSNotFound)
            {
                searchRange.location = foundRange.location+foundRange.length;
            } else
            {
                // no more substring to find
                break;
            }
        }
    }
    return text;
}
@end
