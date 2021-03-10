module Utils.Mail.RegistrationMail (registrationInitMail) where

import qualified Data.Text as T
import Network.Mail.Mime (ImageContent (ImageFilePath), InlineImage (..))
import Server.Config
import Utils.Mail.Common


registrationInitMailHtml :: T.Text -> T.Text
registrationInitMailHtml link = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:v=\"urn:schemas-microsoft-com:vml\"> <head><!--[if gte mso 9]><xml ><o:OfficeDocumentSettings ><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings ></xml ><! [endif]--> <meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"/> <meta content=\"width=device-width\" name=\"viewport\"/> <meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"/> <title></title> <style type=\"text/css\"> body{margin: 0; padding: 0;}table, td, tr{vertical-align: top; border-collapse: collapse;}*{line-height: inherit;}a[x-apple-data-detectors=\"true\"]{color: inherit !important; text-decoration: none !important;}</style> <style id=\"media-query\" type=\"text/css\"> @media (max-width: 520px){.block-grid, .col{min-width: 320px !important; max-width: 100% !important; display: block !important;}.block-grid{width: 100% !important;}.col{width: 100% !important;}.col_cont{margin: 0 auto;}img.fullwidth, img.fullwidthOnMobile{max-width: 100% !important;}.no-stack .col{min-width: 0 !important; display: table-cell !important;}.no-stack.two-up .col{width: 50% !important;}.no-stack .col.num2{width: 16.6% !important;}.no-stack .col.num3{width: 25% !important;}.no-stack .col.num4{width: 33% !important;}.no-stack .col.num5{width: 41.6% !important;}.no-stack .col.num6{width: 50% !important;}.no-stack .col.num7{width: 58.3% !important;}.no-stack .col.num8{width: 66.6% !important;}.no-stack .col.num9{width: 75% !important;}.no-stack .col.num10{width: 83.3% !important;}.video-block{max-width: none !important;}.mobile_hide{min-height: 0px; max-height: 0px; max-width: 0px; display: none; overflow: hidden; font-size: 0px;}.desktop_hide{display: block !important; max-height: none !important;}}</style> </head> <body class=\"clean-body\" style=\"margin: 0; padding: 0; -webkit-text-size-adjust: 100%; background-color: #ffffff\" > <table bgcolor=\"#FFFFFF\" cellpadding=\"0\" cellspacing=\"0\" class=\"nl-container\" role=\"presentation\" style=\" table-layout: fixed; vertical-align: top; min-width: 320px; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #ffffff; width: 100%; \" valign=\"top\" width=\"100%\" > <tbody> <tr style=\"vertical-align: top\" valign=\"top\"> <td style=\"word-break: break-word; vertical-align: top\" valign=\"top\"> <div style=\"background-color: transparent\"> <div class=\"block-grid\" style=\" min-width: 320px; max-width: 500px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; \" > <div style=\" border-collapse: collapse; display: table; width: 100%; background-color: transparent; \" > <div class=\"col num12\" style=\" min-width: 320px; max-width: 500px; display: table-cell; vertical-align: top; width: 500px; \" > <div class=\"col_cont\" style=\"width: 100% !important\"> <div style=\" border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; \" > <div align=\"left\" class=\"img-container left fixedwidth\" style=\"padding-right: 0px; padding-left: 0px\" ><!--[if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr style=\"line-height:0px\"><td style=\"padding-right: 0px;padding-left: 0px;\" align=\"left\"><! [endif]--><svg width=\"1003\" height=\"268\" viewBox=\"0 0 1003 268\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><rect width=\"1003\" height=\"268\" fill=\"white\"/><path d=\"M304.999 145.962H287.494V185H265.521V78.3594H305.146C317.743 78.3594 327.46 81.167 334.296 86.7822C341.132 92.3975 344.55 100.332 344.55 110.586C344.55 117.861 342.963 123.94 339.789 128.823C336.664 133.657 331.903 137.515 325.507 140.396L348.578 183.975V185H324.994L304.999 145.962ZM287.494 128.164H305.219C310.736 128.164 315.009 126.772 318.036 123.989C321.063 121.157 322.577 117.275 322.577 112.344C322.577 107.314 321.137 103.359 318.256 100.479C315.424 97.5977 311.054 96.1572 305.146 96.1572H287.494V128.164ZM396.405 186.465C384.784 186.465 375.312 182.9 367.987 175.771C360.712 168.643 357.074 159.146 357.074 147.28V145.229C357.074 137.271 358.612 130.166 361.688 123.916C364.765 117.617 369.11 112.783 374.726 109.414C380.39 105.996 386.835 104.287 394.062 104.287C404.901 104.287 413.422 107.705 419.623 114.541C425.873 121.377 428.998 131.069 428.998 143.618V152.261H378.534C379.218 157.437 381.269 161.587 384.687 164.712C388.153 167.837 392.523 169.399 397.797 169.399C405.951 169.399 412.323 166.445 416.913 160.537L427.313 172.183C424.14 176.675 419.843 180.19 414.423 182.729C409.003 185.22 402.997 186.465 396.405 186.465ZM393.988 121.426C389.789 121.426 386.371 122.842 383.734 125.674C381.146 128.506 379.486 132.559 378.754 137.832H408.197V136.147C408.1 131.46 406.83 127.847 404.389 125.308C401.947 122.72 398.48 121.426 393.988 121.426ZM437.787 144.644C437.787 132.192 440.546 122.354 446.063 115.127C451.63 107.9 459.247 104.287 468.915 104.287C477.411 104.287 484.174 107.534 489.203 114.028L490.595 105.752H509.198V215.469H487.958V178.188C483.075 183.706 476.679 186.465 468.769 186.465C459.345 186.465 451.825 182.803 446.21 175.479C440.595 168.154 437.787 157.876 437.787 144.644ZM458.954 146.182C458.954 153.75 460.272 159.512 462.909 163.467C465.595 167.422 469.354 169.399 474.188 169.399C480.683 169.399 485.272 166.812 487.958 161.636V128.896C485.321 123.916 480.78 121.426 474.335 121.426C469.452 121.426 465.668 123.403 462.982 127.358C460.297 131.313 458.954 137.588 458.954 146.182ZM573.358 176.943C568.134 183.291 560.907 186.465 551.679 186.465C543.183 186.465 536.688 184.023 532.196 179.141C527.753 174.258 525.482 167.104 525.385 157.681V105.752H546.552V156.948C546.552 165.2 550.312 169.326 557.831 169.326C565.009 169.326 569.94 166.836 572.626 161.855V105.752H593.866V185H573.944L573.358 176.943ZM646.308 186.465C634.687 186.465 625.214 182.9 617.89 175.771C610.614 168.643 606.977 159.146 606.977 147.28V145.229C606.977 137.271 608.515 130.166 611.591 123.916C614.667 117.617 619.013 112.783 624.628 109.414C630.292 105.996 636.737 104.287 643.964 104.287C654.804 104.287 663.324 107.705 669.525 114.541C675.775 121.377 678.9 131.069 678.9 143.618V152.261H628.437C629.12 157.437 631.171 161.587 634.589 164.712C638.056 167.837 642.426 169.399 647.699 169.399C655.854 169.399 662.226 166.445 666.815 160.537L677.216 172.183C674.042 176.675 669.745 180.19 664.325 182.729C658.905 185.22 652.899 186.465 646.308 186.465ZM643.891 121.426C639.691 121.426 636.273 122.842 633.637 125.674C631.049 128.506 629.389 132.559 628.656 137.832H658.1V136.147C658.002 131.46 656.732 127.847 654.291 125.308C651.85 122.72 648.383 121.426 643.891 121.426ZM733.905 163.101C733.905 160.513 732.611 158.486 730.023 157.021C727.484 155.508 723.383 154.165 717.719 152.993C698.871 149.038 689.447 141.03 689.447 128.97C689.447 121.938 692.353 116.079 698.163 111.392C704.022 106.655 711.664 104.287 721.088 104.287C731.146 104.287 739.179 106.655 745.185 111.392C751.239 116.128 754.267 122.28 754.267 129.849H733.1C733.1 126.821 732.123 124.331 730.17 122.378C728.217 120.376 725.165 119.375 721.015 119.375C717.45 119.375 714.691 120.181 712.738 121.792C710.785 123.403 709.809 125.454 709.809 127.944C709.809 130.288 710.907 132.192 713.104 133.657C715.351 135.073 719.11 136.318 724.384 137.393C729.657 138.418 734.101 139.59 737.714 140.908C748.896 145.01 754.486 152.114 754.486 162.222C754.486 169.448 751.386 175.308 745.185 179.8C738.983 184.243 730.976 186.465 721.161 186.465C714.521 186.465 708.612 185.293 703.437 182.949C698.31 180.557 694.281 177.31 691.352 173.208C688.422 169.058 686.957 164.59 686.957 159.805H707.025C707.221 163.564 708.612 166.445 711.2 168.447C713.788 170.449 717.255 171.45 721.601 171.45C725.653 171.45 728.705 170.693 730.756 169.18C732.855 167.617 733.905 165.591 733.905 163.101ZM793.524 86.2695V105.752H807.074V121.279H793.524V160.83C793.524 163.76 794.086 165.859 795.209 167.129C796.332 168.398 798.48 169.033 801.654 169.033C803.998 169.033 806.073 168.862 807.88 168.521V184.561C803.729 185.83 799.457 186.465 795.062 186.465C780.219 186.465 772.65 178.97 772.357 163.979V121.279H760.785V105.752H772.357V86.2695H793.524ZM928.437 185H855.341V170.498L889.838 133.73C894.574 128.555 898.065 124.038 900.312 120.181C902.606 116.323 903.754 112.661 903.754 109.194C903.754 104.458 902.558 100.747 900.165 98.0615C897.772 95.3271 894.354 93.96 889.911 93.96C885.126 93.96 881.342 95.6201 878.559 98.9404C875.824 102.212 874.457 106.533 874.457 111.904H853.217C853.217 105.41 854.755 99.4775 857.831 94.1064C860.956 88.7354 865.351 84.5361 871.015 81.5088C876.679 78.4326 883.1 76.8945 890.277 76.8945C901.264 76.8945 909.784 79.5312 915.839 84.8047C921.942 90.0781 924.994 97.5244 924.994 107.144C924.994 112.417 923.627 117.788 920.893 123.257C918.158 128.726 913.471 135.098 906.83 142.373L882.587 167.935H928.437V185Z\" fill=\"black\"/><rect x=\"64\" y=\"60\" width=\"148\" height=\"148\" rx=\"31\" fill=\"#E0E7FF\"/><circle cx=\"96.56\" cy=\"92.56\" r=\"16.28\" fill=\"#C7D2FE\"/><circle cx=\"96.56\" cy=\"134\" r=\"16.28\" fill=\"#C7D2FE\"/><circle cx=\"138\" cy=\"92.56\" r=\"16.28\" fill=\"#C7D2FE\"/><circle cx=\"96.56\" cy=\"175.44\" r=\"16.28\" fill=\"#4338CA\"/><circle cx=\"138\" cy=\"134\" r=\"16.28\" fill=\"#C7D2FE\"/><circle cx=\"179.44\" cy=\"134\" r=\"16.28\" fill=\"#C7D2FE\"/><circle cx=\"138\" cy=\"175.44\" r=\"16.28\" fill=\"#C7D2FE\"/><circle cx=\"179.44\" cy=\"92.56\" r=\"16.28\" fill=\"#4338CA\"/><circle cx=\"179.44\" cy=\"175.44\" r=\"16.28\" fill=\"#C7D2FE\"/></svg></div><div style=\" color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; \" > <div style=\" line-height: 1.2; font-size: 12px; color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; \" > <p style=\" line-height: 1.2; word-break: break-word; font-size: 14px; mso-line-height-alt: 17px; margin: 0; \" ><span style=\"font-size: 14px\">Hey,</span></p > <p style=\" line-height: 1.2; word-break: break-word; mso-line-height-alt: 14px; margin: 0; \" > </p > <p style=\" line-height: 1.2; word-break: break-word; font-size: 14px; mso-line-height-alt: 17px; margin: 0; \" ><span style=\"font-size: 14px\" >It seems that you registered for a new account in Request 2. If it so, we\'re happy to tell you that your email address is now verified! Please click the following link to complete the registration process.</span ></p > </div></div><div align=\"center\" class=\"button-container\" style=\" padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; \" ><!--[if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-spacing: 0; border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;\"><tr><td style=\"padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px\" align=\"center\"><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"" <> link <> "\" style=\"height:31.5pt; width:177pt; v-text-anchor:middle;\" arcsize=\"24%\" stroke=\"false\" fillcolor=\"#4fd1c5\"><w:anchorlock/><v:textbox inset=\"0,0,0,0\"><center style=\"color:#ffffff; font-family:Arial, sans-serif; font-size:14px\"><! [endif]--><a href=\"" <> link <> "\" style=\" -webkit-text-size-adjust: none; text-decoration: none; display: inline-block; color: #ffffff; background-color: #4fd1c5; border-radius: 10px; -webkit-border-radius: 10px; -moz-border-radius: 10px; width: auto; width: auto; border-top: 1px solid #4fd1c5; border-right: 1px solid #4fd1c5; border-bottom: 1px solid #4fd1c5; border-left: 1px solid #4fd1c5; padding-top: 5px; padding-bottom: 5px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; text-align: center; mso-border-alt: none; word-break: keep-all; \" target=\"_blank\" ><span style=\" padding-left: 20px; padding-right: 20px; font-size: 14px; display: inline-block; \" ><span style=\" font-size: 16px; line-height: 2; word-break: break-word; mso-line-height-alt: 32px; \" ><span data-mce-style=\"font-size: 14px; line-height: 28px;\" style=\"font-size: 14px; line-height: 28px\" >Complete the registration</span ></span ></span ></a > </div><div style=\" color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; \" > <div style=\" line-height: 1.2; font-size: 12px; color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; \" > <p style=\" font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; \" >If you didn\'t make this request, you can safely ignore this email.</p > </div></div><div style=\" color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; \" > <div style=\" line-height: 1.2; font-size: 12px; color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; \" > <p style=\" font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; \" >Regards,</p > <p style=\" font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; \" >The Request 2 team</p > </div></div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider\" role=\"presentation\" style=\" table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; \" valign=\"top\" width=\"100%\" > <tbody> <tr style=\"vertical-align: top\" valign=\"top\"> <td class=\"divider_inner\" style=\" word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; \" valign=\"top\" > <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"divider_content\" role=\"presentation\" style=\" table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 1px solid #bbbbbb; width: 100%; \" valign=\"top\" width=\"100%\" > <tbody> <tr style=\"vertical-align: top\" valign=\"top\"> <td style=\" word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; \" valign=\"top\" ><span></span ></td></tr></tbody> </table> </td></tr></tbody> </table> <div style=\" color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 0px; padding-right: 10px; padding-bottom: 0px; padding-left: 10px; \" > <div style=\" line-height: 1.2; font-size: 12px; color: #555555; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; \" > <p style=\" font-size: 10px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 12px; margin: 0; \" ><span style=\"font-size: 10px\" >Don\'t reply to this email, it was generated automatically. </span></p > <p style=\" font-size: 10px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 12px; margin: 0; \" ><span style=\"font-size: 10px\" >If you have any questions, please contact our support directly.</span ></p > </div></div></div></div></div></div></div></div></td></tr></tbody> </table> </body></html>"


registrationInitMailStr :: T.Text -> T.Text
registrationInitMailStr link = "Hey,\r\n\r\nIt seems that you registered for a new account in Request 2. If it so, we\'re happy to tell you that your email address is now verified! Please click the following link to complete the registration process: " <> link <> "\r\n\r\nIf you didn\'t make this request, you can safely ignore this email.\r\n\r\nRegards,\r\nThe Request 2 team"


registrationInitMail :: Config -> Address -> T.Text -> IO Mail
registrationInitMail cfg to link =
    htmlMail'
        cfg
        to
        "New Request 2 account registration"
        (registrationInitMailStr link)
        (registrationInitMailHtml link)
        []
