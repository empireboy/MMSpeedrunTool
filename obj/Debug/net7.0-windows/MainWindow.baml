   M S B A M L   `   `   `  ����I  EMMSpeedrunTool, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:MMSpeedrunToolMMSpeedrunTool  5   	       MMSpeedrunTool.MainWindow   5   	   W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:MMSpeedrunTool     5   	   
���   �  � Title$  MMSpeedrunTool��5   	   $	��380��6    $	��500��6-   $	��380��69   $	��500��6I   $	��500��6X   $	��380��6g    � WindowStartupLocation$ CenterScreen=�6w    � 	Resources 5	      '  !System.Windows.Shell.WindowChrome   CustomChrome   CaptionHeight   CornerRadius   GlassFrameThickness  MinimalisticScrollBar �� 
TargetType �� Property �� Value	 �� 
TargetType
 ]�Name ]� DecreaseRepeatButton J� Opacity ]� Thumb ]� IncreaseRepeatButton��%�  &	        &	 B       5
   
   $ 30Q�6,   $ 0,0,0,0��6?   $ 0,0,0,1q�6V   �� 5   
   " ��6.   .�5      ��  � �� 5      �� 5      "	 ��6&   .R�5      � .+�5      ]� $
 
PART_Track��6$   $
��True��68    5   "   �� 5   &   $��ScrollBar.LineUpCommand��63   $ 0Q�6U    5   "   n� 5   &   
������ $��6��6E    5   "   �� 5   &   $��ScrollBar.LineDownCommand��63   $ 0Q�6W   5      5      5      5      5      5          WindowChrome 5!      �� 5"   
    �� ResourceKey$ CustomChrome��6"   .��5$      �� $
��Auto=�6   .��5%   
   � .+�5&      �� $ ��Images/ManicMinersMenu.png��6   $��UniformToFill=�68   $ 1Q�6P   $��Right=�6\    J� Effect 5'      -  'System.Windows.Media.Effects.BlurEffect  5(         Radius$ 0Q�6!      
KernelType$ Gaussian=�6,   ��5*      u� 5+       u� Left$ 0Q�6    
 u� Top$	 -30Q�6)    u� Right$	 -40Q�63    u� Bottom$ 0Q�6?   5-      � 5/      $��16q�6    � RowDefinitions 51      �� 52      $��80 �6$   �� 53      $
��auto �6$   �� 54      $
��auto �6$   �� 55      $
��auto �6$   �� 56      $
��auto �6$   �� 57      $
��auto �6$    � ColumnDefinitions 5:      �� 5;      $��* �6'   �� 5<      $��* �6'   .+�5?      �� $��2��6   $��0��6)   $��2��69   $��10q�6M   ���#f5f5f5$ 1Q�6h    �� RadiusX$ 5��6t    �� RadiusY$ 5��6�   �� 5A      $��2��6   $��0��6&   $��2��66   $��10q�6J   
���   �$��1q�6j    �� CornerRadius$ 5��6~   �� 5C      $��3��6   $��0��6)   $��2��69   $��10q�6M   ���#f5f5f5$ 1Q�6h   $ 5��6t   $ 5��6�   �� 5E      $��3��6   $��0��6&   $��2��66   $��10q�6J   
���   �$��1q�6j   $ 5��6~   �� 5G      $��4��6   $��0��6)   $��2��69   $��10q�6M   ���#f5f5f5$ 1Q�6h   $ 5��6t   $ 5��6�   �� 5I      $��4��6   $��0��6&   $��2��66   $��10q�6J   
���   �$��1q�6j   $ 5��6~   �� 5K      $��5��6   $��0��6)   $��2��69   $��10q�6M   ���#f5f5f5$ 1Q�6h   $ 5��6t   $ 5��6�   �� 5M      $��5��6   $��0��6&   $��2��66   $��10q�6J   
���   �$��1q�6j   $ 5��6~   �� 5O      -   5        $��btnExit��5O      $	��Top=�6A   $
��Left=�6Y   $��5q�6t   
������ 
������ 
������ ��5P      �� 5Q      " ��6     �� Triggers 5R      P� 5S   "    P� Property �@J�IsMouseOver P� Value$
 True��6A   . �5T   &   ��  �@J�Opacity$	 0.6Q�6@   5U   #   5W      .��5Y      �� $	��✗��6    $��32(�6)   $
��Bold"�67   
��� E��6I   5Z      �� 5\      $��1��6   $��0��6*   $��2��6:   $��20q�6N   .+�5]      �� $
��Wrap=�6    
���\\��
���   �  �� Padding$  0q�6^   $
��Bold"�6j   FDNote that everything will be backed up and no progress will be lost.6�   5^      �� 5`      $��2��6   $��0��6*   $��20q�6:   .+�5a      �� $��Courier Prime)�6   $��0,0,0,5q�67   $
��Bold"�6I   
����d�.��6w   	INSTALL6�   �� 5b      $��Courier Prime)�6    $
��Wrap=�6;   ^\This will install a Speedrunner profile with 10 maxed miners and speedrun specific settings.6�   5c      �� 5e      $��2��6   $��1��6*   $��20q�6:   .+�5f      �� -   5        ! ��Name$"! btnInstallSpeedrunnerProfile��5f      $	��170��6C   $��Courier Prime)�6O   .��6�   Install Speedrunner Profile6�   �� 5g      -   5        " ��Name$$" InstallSpeedrunnerProfileError��5g      $��0,10,0,0q�6F   $��Courier Prime)�6X   # �� TextWrapping$
# Wrap=�6s   
��� � �$
��Bold"�6�   $��Center=�6�   $ �� TextAlignment$$ Center=�6�   
������ % �� 
IsReadOnly$
% True��6�   $��0q�6  6!  5h      �� 5j      $��3��6   $��0��6*   $��20q�6:   .+�5k      �� $��Courier Prime)�6   $��0,0,0,5q�67   $
��Bold"�6I   
����d�.��6w   INSTALL SETTINGS ONLY6�   �� 5l      $��Courier Prime)�6    $
��Wrap=�6;   �This will only install speedrun specific settings. It will be helpful for doing NG+ runs without wanting a Speedrunner profile.6�   5m      �� 5o      $��3��6   $��1��6*   $��20q�6:   .+�5p      �� -   5        $! btnInstallSettings��5p      $	��170��69   $��Courier Prime)�6E   .��6�   Install Settings6�   �� 5q      -   5        $" InstallSettingsError��5q      $��0,10,0,0q�6<   $��Courier Prime)�6N   $
# Wrap=�6i   
��� � �$
��Bold"�6�   $��Center=�6�   $$ Center=�6�   
������ $
% True��6�   $��0q�6  6  5r      �� 5t      $��4��6   $��0��6*   $��20q�6:   .+�5u      �� $��Courier Prime)�6   $��0,0,0,5q�67   $
��Bold"�6I   
����d�.��6w   REVERT SETTINGS6�   �� 5v      $��Courier Prime)�6    $
��Wrap=�6;   -+This will revert back to your own settings.6|   5w      �� 5y      $��4��6   $��1��6*   $��20q�6:   .+�5z      �� -   5        $! btnRevertSettings��5z      $	��170��68   $��Courier Prime)�6D   ${�False��6�   .��6�   Revert Settings6�   �� 5{      -   5        $" RevertSettingsError��5{      $��0,10,0,0q�6;   $��Courier Prime)�6M   $
# Wrap=�6h   
��� � �$
��Bold"�6�   $��Center=�6�   $$ Center=�6�   
������ $
% True��6�   $��0q�6   6  5|      �� 5~      $��5��6   $��0��6*   $��20q�6:   .+�5      �� $��Courier Prime)�6   $��0,0,0,5q�67   $
��Bold"�6I   
����d�.��6w   REMOVE6   �� 5�      $��Courier Prime)�6    $
��Wrap=�6;   KIThis will remove the Speedrunners profile and remove all 10 maxed miners.6�   5�      �� 5�      $��5��6   $��1��6*   $��20q�6:   .+�5�      �� -   5        $!! btnRemoveSpeedrunnerProfile��5�      $	��170��6B   $��Courier Prime)�6N   ${�False��6�   .��6�   Remove Speedrunner Profile6�   �� 5�      -	   5        $#" RemoveSpeedrunnerProfileError��5�      $��0,10,0,0q�6E   $��Courier Prime)�6W   $
# Wrap=�6r   
��� � �$
��Bold"�6�   $��Center=�6�   $$ Center=�6�   
������ $
% True��6�   $��0q�6
  6   5�      5�      5�       5�   
   & �� BasedOn��%0   '��       7  �� 5�      " ��6   8&   6+   5�      5�      5�      