Add-Type -AssemblyName PresentationFramework,PresentationCore,WindowsBase

Function New-GraphXAMLClass {
    Param (
        $ClassName,
        $ClassHash
    )

    $Class = @"
using System.ComponentModel;
using System.Windows;
public class $ClassName : INotifyPropertyChanged
{

"@
    Foreach ($Key in $ClassHash.Keys) {
        $ClassType = $ClassHash[$Key]
        $Class = $Class + @"
        private $ClassType private$Key;
        public $ClassType $key
        {
            get { return private$Key; }
            set
            {
                private$Key = value;
                NotifyPropertyChanged("$Key");
            }
        }
"@
    }
$Class = $Class + @"

    public event PropertyChangedEventHandler PropertyChanged;
    private void NotifyPropertyChanged(string property)
    {
        if(PropertyChanged != null)
        {
            PropertyChanged(this, new PropertyChangedEventArgs(property));
        }
    }
}
"@
    try {
        $null = Add-Type -Language CSharp $Class -ErrorAction SilentlyContinue
        
    }
    catch {
        
    }
}

Function Add-GraphTreeItem {
    param(
        $Name,
        $Parent,
        $Tag
    )
    $NewItem = New-Object System.Windows.Controls.TreeViewItem
    $NewItem.Header = $Name
    $NewItem.Tag = $Tag
    $Null = $Parent.Items.Add($NewItem)
}

Function Set-GraphTreeViewVisibility {
    Param(
        $FilterText,
        $TreeItem
    )
    if($TreeItem.Items.Count -eq 0) {
        if([string]::IsNullOrEmpty($FilterText)) {
            $TreeItem.Visibility = [System.Windows.Visibility]::Visible
        }
        elseif($TreeItem.Header.ToLower().contains($FilterText.ToLower())) {
            $TreeItem.Visibility = [System.Windows.Visibility]::Visible
        }
        else {
            $TreeItem.Visibility = [System.Windows.Visibility]::Collapsed
        }
    }
    else {
        foreach($instance in $TreeItem.Items) {
            Set-GraphTreeViewVisibility -FilterText $FilterText -TreeItem $instance
        }
    }
}

Function Add-GraphMetadataTree {
    Param(
        $type,
        $metadata,
        $parent,
        $datahash
    )
    
    $tempparenttype = New-Object System.Windows.Controls.TreeViewItem
    $tempparenttype.Header = $type
    
    $SortArray = New-Object System.Collections.ArrayList

    foreach($instance in $metadata."$type") {
        $tempobject = New-Object SortProperties
        if($type -eq 'Annotations') {
            $tempobject.Name = $instance.Target
            $tempobject.Value = $instance
            $null = $SortArray.Add($tempobject)
        }
        else {
            $tempobject.Name = $instance.Name
            $tempobject.Value = $instance
            $null = $SortArray.Add($tempobject)
        }
    }

    $SortArray = $SortArray | Sort-Object -Property Name

    foreach($instance in $SortArray) {
        $tempguid = (New-Guid).Guid
        $null = Add-GraphTreeItem -Name $instance.Name -Parent $tempparenttype -Tag $tempguid
        $DataHash[$tempguid] = $instance.Value
    }
    $null = $parent.Items.Add($tempparenttype)
    return $datahash
}

[xml]$xaml = @'
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Graph PS Explorer" Height="550" Width="725">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="30"/>
            <RowDefinition Height="30"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="2*"/>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="*"/>
            <ColumnDefinition Width="2*"/>
            <ColumnDefinition Width="75"/>
        </Grid.ColumnDefinitions>
        <Label Grid.Row="0" Grid.Column="0" Content="Tenant Name:"/>
        <TextBox Grid.Row="0" Grid.Column="1" Grid.ColumnSpan="2" Margin="2" HorizontalContentAlignment="Left" VerticalContentAlignment="Center" Text="{Binding Path=TenantName}"/>
        <Button Name="Btn_Connect" Content="Connect" Grid.Row="0" Grid.Column="3" Margin="3"/>
        <Label Content="{Binding LabelTenantUser}" Grid.Row="0" Grid.Column="4" Grid.ColumnSpan="3" VerticalAlignment="Center"/>
        <Label Grid.Row="1" Grid.Column="0" Content="Filter:" HorizontalAlignment="Right" VerticalAlignment="Center"/>
        <TextBox Name="Txt_Filter" Grid.Row="1" Grid.Column="1" Margin="2" VerticalContentAlignment="Center" Text="{Binding Filter}"/>
        <TabControl Grid.Row="1" Grid.Column="2" Grid.RowSpan="2" Grid.ColumnSpan="4">
            <TabItem Header="Properties" Name="Tab_Properties">
                <DataGrid IsReadOnly="True" CanUserAddRows="False" ItemsSource="{Binding PropertiesGrid, Mode=TwoWay}"/>
            </TabItem>
            <TabItem Header="Navigation Properties"  Name="Tab_NavigationProperties">
                <DataGrid IsReadOnly="True" CanUserAddRows="False" ItemsSource="{Binding NavigationPropertiesGrid, Mode=TwoWay}"/>
            </TabItem>
            <TabItem Header="Members" Name="Tab_Members">
                <DataGrid IsReadOnly="True" CanUserAddRows="False" ItemsSource="{Binding MemberGrid, Mode=TwoWay}"/>
            </TabItem>
            <TabItem Header="Parameters" Name="Tab_Parameters">
                <DataGrid IsReadOnly="True" CanUserAddRows="False" ItemsSource="{Binding ParameterGrid, Mode=TwoWay}"/>
            </TabItem>
            <TabItem Header="Annotations" Name="Tab_Annotations">
                <DataGrid IsReadOnly="True" CanUserAddRows="False" ItemsSource="{Binding AnnotationGrid, Mode=TwoWay}"/>
            </TabItem>
            <TabItem Header="Raw Data">
                <TextBox IsReadOnly="True" Text="{Binding RawData}" HorizontalScrollBarVisibility="Visible" VerticalScrollBarVisibility="Auto"/>
            </TabItem>
        </TabControl>
        <TreeView Name="MDTree" Grid.Row="2" Grid.Column="0" Grid.ColumnSpan="2" ItemsSource="{Binding MetaDataTree}"/>
        <Expander Grid.Row="3" Header="Log" Grid.Column="0" Grid.ColumnSpan="10">
            <TextBox Height="100" IsReadOnly="True" Text="{Binding Log}" HorizontalScrollBarVisibility="Visible" VerticalScrollBarVisibility="Auto"/>
        </Expander>
    </Grid>
</Window>
'@

$v1Metadata = Get-GraphMetadata -Version 'v1.0'
$BetaMetadata = Get-GraphMetadata -Version 'Beta'

$WindowClassHash = @{
    'TenantName' = 'string'
    'LabelTenantUser' = 'string'
    'Filter' = 'string'
    'PropertiesGrid' = 'object'
    'NavigationPropertiesGrid' = 'object'
    'MemberGrid' = 'object'
    'ParameterGrid' = 'object'
    'AnnotationGrid' = 'object'
    'RawData' = 'string'
    'MetaDataTree' = 'object'
    'Log' = 'string'
}
New-GraphXAMLClass -ClassName 'WindowClass' -ClassHash $WindowClassHash

$AnnotationGridClassHash = @{
    'Term' = 'string'
    'Record' = 'string'
}
New-GraphXAMLClass -ClassName 'AnnotationGridClass' -ClassHash $AnnotationGridClassHash

$MemberGridClassHash = @{
    'Name'='string'
    'value' = 'string'
}
New-GraphXAMLClass -ClassName 'MemberGridClass' -ClassHash $MemberGridClassHash

$PropertyGridClassHash = @{
    'Name'='string'
    'Type' = 'string'
    'Unicode' = 'string'
    'Nullable' = 'string'
}
New-GraphXAMLClass -ClassName 'PropertyGridClass' -ClassHash $PropertyGridClassHash

$NavigationPropertyGridClassHash = @{
    'Name'='string'
    'Type' = 'string'
}
New-GraphXAMLClass -ClassName 'NavigationPropertyGridClass' -ClassHash $NavigationPropertyGridClassHash

$ParameterGridClassHash = @{
    'Name'='string'
    'Type' = 'string'
    'Nullable' = 'string'
}
New-GraphXAMLClass -ClassName 'ParameterGridClass' -ClassHash $ParameterGridClassHash

Class SortProperties {
    [string]$Name
    [object]$Value
}

$Window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xaml))
$xaml.SelectNodes("//*[@Name]") | Foreach-Object { Set-Variable -Name (("Window" + "_" + $_.Name)) -Value $Window.FindName($_.Name) }

$WindowDataContext = New-Object -TypeName WindowClass

$Window.DataContext = $WindowDataContext

$WindowDataContext.TenantName = $Global:GraphAuthenticationHash.Parameters.TenantName
$WindowDataContext.LabelTenantUser = "User: $($Global:GraphAuthenticationHash.Parameters.Credential.UserName)"

$Window_Btn_Connect.Visibility = [System.Windows.Visibility]::Hidden

$Window_MDTree.Add_SelectedItemChanged({
    $SelItem = $Window_MDTree.SelectedItem
    if(-not [string]::IsNullOrEmpty($SelItem.Tag)) {
        $metadata = $DataHash[$SelItem.Tag]
        [xml]$OuterXML = $metadata.outerxml
        $StringWriter = New-Object System.IO.StringWriter
        $XMLWriter = New-Object System.Xml.XmlTextWriter $StringWriter
        $XMLWriter.Formatting = 'indented'
        $XMLWriter.Indentation = 2
        $OuterXML.WriteContentTo($XMLWriter)
        $XMLWriter.Flush()
        $StringWriter.Flush()
        $WindowDataContext.RawData = $StringWriter.ToString()
        if($metadata.Annotation) {
            $Window_Tab_Annotations.Visibility = [System.Windows.Visibility]::Visible
            $AnnotationsGrid = New-Object System.Collections.ArrayList
            foreach($Annotation in $metadata.Annotation) {
                $tempobject = New-Object -TypeName 'AnnotationGridClass'
                $tempobject.Term = $Annotation.Term.ToString()
                $tempobject.Record = "$($Annotation.Record.PropertyValue.Property)=$($Annotation.Record.PropertyValue.Bool)"
                $null = $AnnotationsGrid.Add($tempobject)
            }
            $WindowDataContext.AnnotationGrid = $AnnotationsGrid
        }
        else {
            $Window_Tab_Annotations.Visibility = [System.Windows.Visibility]::Collapsed
            $WindowDataContext.AnnotationGrid = $null
        }
        if($metadata.Member) {
            $Window_Tab_Members.Visibility = [System.Windows.Visibility]::Visible
            $MembersGrid = New-Object System.Collections.ArrayList
            foreach($Member in $metadata.Member) {
                $tempobject = New-Object -TypeName 'MemberGridClass'
                $tempobject.Name = $Member.Name
                $tempobject.Value = $Member.Value
                $null = $MembersGrid.Add($tempobject)
            }
            $WindowDataContext.MemberGrid = $MembersGrid
        }
        else {
            $Window_Tab_Members.Visibility = [System.Windows.Visibility]::Collapsed
            $WindowDataContext.MemberGrid = $null
        } 
        if($metadata.Property) {
            $Window_Tab_Properties.Visibility = [System.Windows.Visibility]::Visible
            $PropertiesGrid = New-Object System.Collections.ArrayList
            foreach($Property in $metadata.Property) {
                $tempobject = New-Object -TypeName 'PropertyGridClass'
                $tempobject.Name = $Property.Name
                $tempobject.Type = $Property.Type
                $tempobject.Unicode = $Property.Unicode
                $tempobject.Nullable = $Property.Nullable
                $null = $PropertiesGrid.Add($tempobject)
            }
            $WindowDataContext.PropertiesGrid = $PropertiesGrid
        }
        else {
            $Window_Tab_Properties.Visibility = [System.Windows.Visibility]::Collapsed
            $WindowDataContext.PropertiesGrid = $null
        }
        if($metadata.NavigationProperty) {
            $Window_Tab_NavigationProperties.Visibility = [System.Windows.Visibility]::Visible
            $NavigationPropertiesGrid = New-Object System.Collections.ArrayList
            foreach($Property in $metadata.NavigationProperty) {
                $tempobject = New-Object -TypeName 'NavigationPropertyGridClass'
                $tempobject.Name = $Property.Name
                $tempobject.Type = $Property.Type
                $null = $NavigationPropertiesGrid.Add($tempobject)
            }
            $WindowDataContext.NavigationPropertiesGrid = $NavigationPropertiesGrid
        }
        else {
            $Window_Tab_NavigationProperties.Visibility = [System.Windows.Visibility]::Collapsed
            $WindowDataContext.NavigationPropertiesGrid = $null
        }
        if($metadata.Parameter) {
            $Window_Tab_Parameters.Visibility = [System.Windows.Visibility]::Visible
            $ParametersGrid = New-Object System.Collections.ArrayList
            foreach($Parameter in $metadata.Parameter) {
                $tempobject = New-Object -TypeName 'ParameterGridClass'
                $tempobject.Name = $Parameter.Name
                $tempobject.Type = $Parameter.Type
                $tempobject.Nullable = $Parameter.Nullable
                $null = $ParametersGrid.Add($tempobject)
            }
            $WindowDataContext.ParameterGrid = $ParametersGrid
        }
        else {
            $Window_Tab_Parameters.Visibility = [System.Windows.Visibility]::Collapsed
            $WindowDataContext.ParameterGrid = $null
        }
    }
})

$Window_Txt_Filter.Add_TextChanged({
    Set-GraphTreeViewVisibility -FilterText $Window_Txt_Filter.Text -TreeItem $Window_MDTree
})

$DataHash = @{}

$v1TreeRoot = New-Object System.Windows.Controls.TreeViewItem
$v1TreeRoot.Header = 'v1'

$betaTreeRoot = New-Object System.Windows.Controls.TreeViewItem
$betaTreeRoot.Header = 'beta'

$DataHash = Add-GraphMetadataTree -type 'EnumType' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'EntityType' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'ComplexType' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'Action' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'Function' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'EntityContainer' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'Annotations' -metadata $v1Metadata -parent $v1TreeRoot -datahash $DataHash

$DataHash = Add-GraphMetadataTree -type 'EnumType' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'EntityType' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'ComplexType' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'Action' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'Function' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'EntityContainer' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash
$DataHash = Add-GraphMetadataTree -type 'Annotations' -metadata $BetaMetadata -parent $betaTreeRoot -datahash $DataHash

$null = $Window_MDTree.Items.Add($v1TreeRoot)
$null = $Window_MDTree.Items.Add($betaTreeRoot)

$Window.ShowDialog() | Out-Null