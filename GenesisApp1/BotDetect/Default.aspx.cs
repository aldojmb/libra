using System;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using BotDetect;
using BotDetect.Web;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Init(object sender, EventArgs e)
    {
        SampleCaptcha.InitializedCaptchaControl +=
            new EventHandler<InitializedCaptchaControlEventArgs>(SampleCaptcha_InitializedCaptchaControl);
    }

    public static bool UserSetImageStyle
    {
        get
        {
            bool set = false;
            object saved = HttpContext.Current.Session["UserSetImageStyle"];
            if (null != saved)
            {
                try
                {
                    set = (bool)saved;
                }
                catch (InvalidCastException)
                {
                    // ignore cast errors
                    set = false;
                }
            }
            return set; 
        }

        set
        {
            HttpContext.Current.Session["UserSetImageStyle"] = value;
        }
    }

    public static bool UserSetSoundStyle
    {
        get
        {
            bool set = false;
            object saved = HttpContext.Current.Session["UserSetSoundStyle"];
            if (null != saved)
            {
                try
                {
                    set = (bool)saved;
                }
                catch (InvalidCastException)
                {
                    // ignore cast errors
                    set = false;
                }
            }
            return set; 
        }

        set
        {
            HttpContext.Current.Session["UserSetSoundStyle"] = value;
        }
    }

    void SampleCaptcha_InitializedCaptchaControl(object sender, InitializedCaptchaControlEventArgs e)
    {
        if (e.CaptchaId != SampleCaptcha.CaptchaId)
        {
            return;
        }

        CaptchaControl captcha = sender as CaptchaControl;

        if (!UserSetImageStyle)
        {
            // use a completely random image style
            captcha.ImageStyle = CaptchaRandomization.GetRandomImageStyle();
        }

        if (!UserSetSoundStyle)
        {
            // use a completely random sound style
            captcha.SoundStyle = CaptchaRandomization.GetRandomSoundStyle();
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        // initial page setup
        if (!IsPostBack)
        {
            # region form initialization

            // set control text
            ValidateCaptchaButton.Text = "Validate";
            CaptchaCorrectLabel.Text = "Correct!";
            CaptchaIncorrectLabel.Text = "Incorrect!";
            ApplyButton.Text = "Apply";

            // these messages are shown only after validation
            CaptchaCorrectLabel.Visible = false;
            CaptchaIncorrectLabel.Visible = false;

            // code type dropdown initialization
            CodeStyleDropDown.DataSource = Enum.GetNames(typeof(BotDetect.CodeStyle));
            CodeStyleDropDown.DataBind();
            CodeStyleDropDown.SelectedValue = SampleCaptcha.CodeStyle.ToString();

            // image style dropdown initialization
            ImageStyleDropDown.DataSource = Enum.GetNames(typeof(BotDetect.ImageStyle));
            ImageStyleDropDown.DataBind();
            ListItem randomImageStyle = new ListItem("[Random]", "Random");
            randomImageStyle.Selected = true;
            ImageStyleDropDown.Items.Insert(0, randomImageStyle);
            UserSetImageStyle = false;

            // image format dropdown initialization
            ImageFormatDropDown.DataSource = Enum.GetNames(typeof(BotDetect.ImageFormat));
            ImageFormatDropDown.DataBind();
            ImageFormatDropDown.SelectedValue = SampleCaptcha.ImageFormat.ToString();

            // code length textbox and validators initialization
            CodeLengthTextBox.Text = SampleCaptcha.CodeLength.ToString();

            CodeLengthRequiredValidator.ErrorMessage = "Code Length is a required value";
            CodeLengthRequiredValidator.Display = ValidatorDisplay.None;

            CodeLengthRangeValidator.ErrorMessage = "Code Length must be a number between 1 and 15";
            CodeLengthRangeValidator.Type = ValidationDataType.Integer;
            CodeLengthRangeValidator.MinimumValue = (1).ToString();
            CodeLengthRangeValidator.MaximumValue = (15).ToString();
            CodeLengthRangeValidator.Display = ValidatorDisplay.None;

            // image width textbox and validators initialization
            WidthTextBox.Text = SampleCaptcha.ImageSize.Width.ToString();

            WidthRequiredValidator.ErrorMessage = "Width is a required value";
            WidthRequiredValidator.Display = ValidatorDisplay.None;

            WidthRangeValidator.ErrorMessage = "Width must be a number between 20 and 500";
            WidthRangeValidator.Type = ValidationDataType.Integer;
            WidthRangeValidator.MinimumValue = (20).ToString();
            WidthRangeValidator.MaximumValue = (500).ToString();
            WidthRangeValidator.Display = ValidatorDisplay.None;

            // image height textbox and validators initialization
            HeightTextBox.Text = SampleCaptcha.ImageSize.Height.ToString();

            HeightRequiredValidator.ErrorMessage = "Height is a required value";
            HeightRequiredValidator.Display = ValidatorDisplay.None;

            HeightRangeValidator.ErrorMessage = "Height must be a number between 20 and 200";
            HeightRangeValidator.Type = ValidationDataType.Integer;
            HeightRangeValidator.MinimumValue = (20).ToString();
            HeightRangeValidator.MaximumValue = (200).ToString();
            HeightRangeValidator.Display = ValidatorDisplay.None;

            // audio style dropdown initialization
            SoundStyleDropDown.DataSource = Enum.GetNames(typeof(BotDetect.SoundStyle));
            SoundStyleDropDown.DataBind();
            ListItem randomSoundStyle = new ListItem("[Random]", "Random");
            randomSoundStyle.Selected = true;
            SoundStyleDropDown.Items.Insert(0, randomSoundStyle);
            UserSetSoundStyle = false;

            // audio format dropdown initialization
            SoundFormatDropDown.DataSource = Enum.GetNames(typeof(BotDetect.SoundFormat));
            SoundFormatDropDown.DataBind();
            SoundFormatDropDown.Items.Remove("Unknown");
            SoundFormatDropDown.SelectedValue = SampleCaptcha.SoundFormat.ToString();

            // validation summary initialization
            PageValidationSummary.HeaderText = "Please correct the following errors:";
            PageValidationSummary.DisplayMode = ValidationSummaryDisplayMode.BulletList;
            PageValidationSummary.ShowMessageBox = true;
            PageValidationSummary.ShowSummary = false;

            # endregion form initialization
        }

        // setup client-side input processing
        SampleCaptcha.UserInputClientID = CaptchaCodeTextBox.ClientID;
    }

    protected void ValidateCaptchaButton_Click(object sender, EventArgs e)
    {
        // validate the Captcha to check we're not dealing with a bot
        string code = CaptchaCodeTextBox.Text.Trim().ToUpper();
        bool isHuman = SampleCaptcha.Validate(code);
        CaptchaCodeTextBox.Text = null; // clear previous user input

        if (isHuman)
        {
            CaptchaCorrectLabel.Visible = true;
            CaptchaIncorrectLabel.Visible = false;
        }
        else
        {
            CaptchaCorrectLabel.Visible = false;
            CaptchaIncorrectLabel.Visible = true;
        }
    }

    protected void ApplyButton_Click(object sender, EventArgs e)
    {
        Page.Validate();

        // read input values and set BotDetect control properties 
        if (Page.IsValid)
        {
            // clear previous user input
            CaptchaCodeTextBox.Text = null;
            CaptchaCorrectLabel.Visible = false;
            CaptchaIncorrectLabel.Visible = false;

            // read and set code length
            SampleCaptcha.CodeLength = Int32.Parse(CodeLengthTextBox.Text);

            // read and set locale
            SampleCaptcha.Locale = LocaleDropDown.SelectedValue;

            // read and set code type
            object codeStyle = Enum.Parse(typeof(BotDetect.CodeStyle), CodeStyleDropDown.SelectedValue);
            SampleCaptcha.CodeStyle = (BotDetect.CodeStyle)codeStyle;

            // read and set image style
            if ("Random" == ImageStyleDropDown.SelectedValue)
            {
                UserSetImageStyle = false;
                SampleCaptcha.ImageStyle = ImageStyle.Chalkboard;
            }
            else
            {
                object imageStyle = Enum.Parse(typeof(BotDetect.ImageStyle), ImageStyleDropDown.SelectedValue);
                SampleCaptcha.ImageStyle = (BotDetect.ImageStyle)imageStyle;
                UserSetImageStyle = true;
            }

            // custom light color
            if ("Default" == CustomLightColorDropDown.SelectedValue)
            {
                SampleCaptcha.CustomLightColor = Color.Empty;
            }
            else
            {
                Color customLightColor = Color.FromName(CustomLightColorDropDown.SelectedValue);
                SampleCaptcha.CustomLightColor = customLightColor;
            }

            // custom dark color
            if ("Default" == CustomDarkColorDropDown.SelectedValue)
            {
                SampleCaptcha.CustomDarkColor = Color.Empty;
            }
            else
            {
                Color customDarkColor = Color.FromName(CustomDarkColorDropDown.SelectedValue);
                SampleCaptcha.CustomDarkColor = customDarkColor;
            }

            // read and set image format
            object imageFormat = Enum.Parse(typeof(BotDetect.ImageFormat), ImageFormatDropDown.SelectedValue);
            SampleCaptcha.ImageFormat = (BotDetect.ImageFormat)imageFormat;

            // read and set image size
            int width = Int32.Parse(WidthTextBox.Text);
            int height = Int32.Parse(HeightTextBox.Text);
            SampleCaptcha.ImageSize = new System.Drawing.Size(width, height);

            // read and set audio style
            if ("Random" == SoundStyleDropDown.SelectedValue)
            {
                UserSetSoundStyle = false;
                SampleCaptcha.SoundStyle = SoundStyle.Dispatch;
            }
            else
            {
                object audioStyle = Enum.Parse(typeof(BotDetect.SoundStyle), SoundStyleDropDown.SelectedValue);
                SampleCaptcha.SoundStyle = (BotDetect.SoundStyle)audioStyle;
                UserSetSoundStyle = true;
            }

            // read and set audio format
            object audioFormat = Enum.Parse(typeof(BotDetect.SoundFormat), SoundFormatDropDown.SelectedValue);
            SampleCaptcha.SoundFormat = (BotDetect.SoundFormat)audioFormat;
        }
    }
}
