namespace BootstrapBlazorApp.Components.Layout;

public partial class MainLayout
{
    private string Theme { get; set; } = "";

    private bool IsFixedHeader { get; set; } = true;

    private bool IsFixedFooter { get; set; } = true;

    private bool IsFullSide { get; set; } = true;

    private bool ShowFooter { get; set; } = true;
}
