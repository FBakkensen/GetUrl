page 50100 ItemAPI
{
    APIGroup = 'bcdev';
    APIPublisher = 'bcdev';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'itemAPI';
    DelayedInsert = true;
    EntityName = 'item';
    EntitySetName = 'items';
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(webUrl; WebURL)
                {
                    Caption = 'Url';
                }
                field(phoneUrl; PhoneURL)
                {
                    Caption = 'Url';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WebURL := GetUrl(ClientType::Web, CompanyName, ObjectType::Page, Page::"Item Card", Rec, false);
        PhoneURL := GetUrl(ClientType::Phone, CompanyName, ObjectType::Page, Page::"Item Card", Rec, false);
    end;

    var
        WebURL: Text;
        PhoneUrl: Text;
}
