unit HisService_Medicine_Impl;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ This is where you are supposed to code the implementation of your objects. }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes,
  SysUtils,
  App_DAServer,
  HisService_Medicine_Backend,
  {RemObjects:} uROXMLIntf,
  uROClientIntf,
  uROTypes,
  uROServer,
  uROServerIntf,
  uROSessions,
  {Required:} uRORemoteDataModule,
  {Ancestor Implementation:} DataAbstractService_Impl,
  {Used RODLs:} DataAbstract4_Intf,
  {Generated:} HisLibrary_Intf,
  uROClient,
  uDACore,
  uDADataStreamer,
  uDAInterfaces,
  uDABin2DataStreamer,
  uDAScriptingProvider,
  uDABusinessProcessor, uDAFields, uDADelta, uROComponent;

type
  { THisService_Medicine }
  THisService_Medicine = class(TDataAbstractService, IHisService_Medicine)
    procedure DataAbstractServiceActivate(const aClientID: TGUID;
      aSession: TROSession; const aMessage: IROMessage);
    procedure DataAbstractServiceDeactivate(const aClientID: TGUID;
      aSession: TROSession);
    procedure BPInOutApplyMasterBeforeProcessChange(
      Sender: TDABusinessProcessor; aChangeType: TDAChangeType;
      aChange: TDADeltaChange; var ProcessChange: Boolean);
    procedure BPInOutApplyDetailAfterProcessChange(Sender: TDABusinessProcessor;
      aChange: TDADeltaChange; Processed: Boolean;
      var CanRemoveFromDelta: Boolean);
    procedure DataAbstractServiceCreate(Sender: TObject);
    procedure DataAbstractServiceUpdateDataBeginTransaction(
      Sender: TObject; var aUseDefaultTransactionLogic: Boolean);
  private
  protected
    { IHisService_Medicine methods }
  end;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$IFNDEF FPC}
{$R *.dfm}
{$ELSE}
{$R *.lfm}
{$ENDIF}
uses
  {Generated:} HisLibrary_Invk,
  uROClassFactories;

procedure Create_HisService_Medicine(out anInstance: IUnknown);
begin
  anInstance := THisService_Medicine.Create(nil);
end;

var
  fClassFactory: IROClassFactory;

{ HisService_Medicine }

procedure THisService_Medicine.DataAbstractServiceActivate(
  const aClientID: TGUID; aSession: TROSession;
  const aMessage: IROMessage);
begin
  ServiceDataStreamer := MedicineBackend.GetDAStreamer;
  ServiceSchema := MedicineBackend.GetSchema;
end;

procedure THisService_Medicine.DataAbstractServiceDeactivate(
  const aClientID: TGUID; aSession: TROSession);
begin
  ServiceSchema := nil;
end;

procedure THisService_Medicine.BPInOutApplyMasterBeforeProcessChange(
  Sender: TDABusinessProcessor; aChangeType: TDAChangeType;
  aChange: TDADeltaChange; var ProcessChange: Boolean);
begin
//  case aChangeType of
//    ctDelete:
//      begin
//        ServiceSchema.NewCommand(Connection,
//          'Pro_Med_InOutMaster_BeforeDelete',
//          ['InOutID'], [aChange.OldValueByName['InOutID']]);
//      end;
//    ctInsert:
//      begin
//        aChange.NewValueByName['ApplyTime'] := Now();
//        // 取得出入库单号
//        aChange.NewValueByName['InOutID'] :=
//        ServiceSchema.NewCommand(Connection,
//            'Pro_Med_InOut_GetID',
//            ['InOutID'], ['']).ParamByName('InOutID').AsString;
//        aChange.RefreshedByServer := True;
//      end;
//  end;
end;

procedure THisService_Medicine.BPInOutApplyDetailAfterProcessChange(
  Sender: TDABusinessProcessor; aChange: TDADeltaChange;
  Processed: Boolean; var CanRemoveFromDelta: Boolean);
begin
//  case aChange.ChangeType of
//    ctInsert:
//      ServiceSchema.NewCommand(Connection, 'Pro_Med_InOutDetail_AfterInsert',
//        ['InOutID', 'FeeID'],
//        [aChange.NewValueByName['InOutID'], aChange.NewValueByName['FeeID']]);
//    ctUpdate:
//      ServiceSchema.NewCommand(Connection, 'Pro_Med_InOutDetail_AfterUpdate',
//        ['InOutID', 'FeeID'],
//        [aChange.OldValueByName['InOutID'], aChange.OldValueByName['FeeID']]);
//  end;
end;

procedure THisService_Medicine.DataAbstractServiceCreate(Sender: TObject);
begin
  AllowWhereSql := True;
end;

procedure THisService_Medicine.DataAbstractServiceUpdateDataBeginTransaction(
  Sender: TObject; var aUseDefaultTransactionLogic: Boolean);
begin  
  aUseDefaultTransactionLogic := False;
end;

initialization
  fClassFactory := TROPooledClassFactory.Create('HisService_Medicine',
    {$IFDEF FPC}@{$ENDIF}Create_HisService_Medicine,
    THisService_Medicine_Invoker, 10);
  // RegisterForZeroConf(fClassFactory,'_HisService_Medicine_rosdk._tcp.');

finalization
  UnRegisterClassFactory(fClassFactory);
  fClassFactory := nil;

end.

