#!/system/bin/sh
GOLD_COLOR="\033[33m"    # 金色：联系方式与参与制作
SUCCESS_COLOR="\033[31m"  # 红色：清理成功
FAIL_COLOR="\033[34m"     # 蓝色：清理失败
RESET_COLOR="\033[0m"     # 重置颜色

# 脚本信息（金色高亮，清晰展示）
echo -e "${GOLD_COLOR}=== 脚本信息 ==="
echo -e "参与制作：白 涛 | ${RESET_COLOR}"

# 核心提示：仅保留扩展包环境要求，不做检测
echo -e "\n=== 重要提示 ==="
echo -e "${SUCCESS_COLOR}请使用扩展包环境执行此脚本，非扩展包环境可能导致清理失败或异常！${RESET_COLOR}"
echo -e "${SUCCESS_COLOR}3秒后开始清理任务...${RESET_COLOR}"
sleep 3  

# 待清理路径列表
clean_paths=(
  # 工具类路径（1-9项）
  "/storage/emulated/0/Android/data/me.garfieldhan.holmes"
  "/storage/emulated/0/Android/data/com.zhenxi.hunter"
  "/storage/emulated/0/Android/data/icu.nullptr.nativetest"
  "/storage/emulated/0/Android/data/com.byyoung.setting"
  "/storage/emulated/0/Android/data/bin.mt.plus"
  "/storage/emulated/0/Android/data/bin.mt.plus.canary"
  "/storage/emulated/0/Android/data/com.omarea.vtools"
  "/storage/emulated/0/Android/data/moe.shizuku.privileged.api"
  "/storage/emulated/0/Android/data/io.github.vvb2060.mahoshojo"

  # obb/media路径（10-18项）
  "/storage/emulated/0/Android/obb/io.github.vvb2060.mahoshojo"
  "/storage/emulated/0/Android/media/io.github.vvb2060.mahoshojo"
  "/storage/emulated/0/Android/obb/icu.nullptr.applistdetector"
  "/storage/emulated/0/Android/data/icu.nullptr.applistdetector"
  "/storage/emulated/0/Android/media/icu.nullptr.applistdetector"
  "/storage/emulated/0/Android/obb/com.byxiaorun.detector"
  "/storage/emulated/0/Android/data/com.byxiaorun.detector"
  "/storage/emulated/0/Android/media/com.byxiaorun.detector"
  "/storage/emulated/0/Android/obb/io.github.huskydg.memorydetector"

  # 系统/data路径（19-35项）
  "/data/property/"
  "/data/property/persistent_properties"
  "/data/local/tmp/byyang/"
  "/data/local/tmp/shizuku"
  "/data/local/tmp/shizuku_starter"
  "/data/local/tmp/resetprop"
  "/data/local/tmp/luckys"
  "/data/local/tmp/input_devices"
  "/data/local/tmp/HyperCeiler"
  "/data/local/tmp/simpleHook simple"
  "/data/local/tmp/DisabledAllGoogleServices"
  "/data/local/tmp/cleaner_starter"
  "/data/local/tmp/byyang"
  "/data/local/tmp/horae_control.log"
  "/data/system/graphicsstats"
  "/data/system/package_cache"
  "/data/system/AppRetention"

  # 其他路径（36-50项）
  "/data/system/NoActive"
  "/data/system/Freezer"
  "/data/system/liboxmem.so"
  "/data/system/liborangeinit.so"
  "/data/system/xydriver.ko"
  "/data/DNA"
  "/data/jz/"
  "/data/jz.sh"
  "/data/gamepad_driver.so"
  "/data/nh"
  "/data/nh5"
  "/data/nh6"
  "/data/nh2"
  "/data/nh3"
  "/data/nh4"
  "/sdcard/MT2/"
)

# 执行路径清理
total=${#clean_paths[@]}
echo -e "\n=== 清理任务（共$total项）==="
seq=0
for path in "${clean_paths[@]}"; do
    seq=$((seq + 1))
    
    rm -rf "$path" 2>/dev/null  
    
    if [[ "$path" == *"me.garfieldhan.holmes"* ]]; then
        echo -e "[$seq/$total] ${SUCCESS_COLOR}Holmes 相关文件已清除${RESET_COLOR}"
    elif [[ "$path" == *"com.zhenxi.hunter"* ]]; then
        echo -e "[$seq/$total] ${SUCCESS_COLOR}Hunter 相关文件已清除${RESET_COLOR}"
    elif [[ "$path" == *"icu.nullptr.nativetest"* ]]; then
        echo -e "[$seq/$total] ${SUCCESS_COLOR}Native Test 相关文件已清除${RESET_COLOR}"
    elif [[ "$path" == *"com.byyoung.setting"* ]]; then
        echo -e "[$seq/$total] ${SUCCESS_COLOR}爱玩机工具箱 相关文件已清除${RESET_COLOR}"
    elif [[ "$path" == *"bin.mt.plus.canary"* ]]; then
        echo -e "[$seq/$total] ${SUCCESS_COLOR}MT管理器 杂质已清理${RESET_COLOR}"
    elif [[ "$path" == *"persistent_properties"* ]]; then
        echo -e "[$seq/$total] ${SUCCESS_COLOR}隐藏应用列表 相关文件已清理${RESET_COLOR}"
    else
        echo -e "[$seq/$total] ${SUCCESS_COLOR}第$seq项清理完成${RESET_COLOR}"
    fi
done

# 新增功能：删除指定路径下的.sh、.json和.img文件（仅根目录）
echo -e "\n=== 清理特定类型文件 ==="
target_paths=(
  "/storage/emulated/0/"
  "/storage/emulated/0/Download/"
)

file_count=0
for target_path in "${target_paths[@]}"; do
    if [ -d "$target_path" ]; then
        echo -e "扫描路径: $target_path"
        
        # 删除.sh文件（仅当前目录）
        for sh_file in "$target_path"*.sh; do
            if [ -f "$sh_file" ]; then
                rm -f "$sh_file" 2>/dev/null && {
                    echo -e "   - ${SUCCESS_COLOR}已删除: $(basename "$sh_file")${RESET_COLOR}"
                    file_count=$((file_count + 1))
                }
            fi
        done
        
        # 删除.json文件（仅当前目录）
        for json_file in "$target_path"*.json; do
            if [ -f "$json_file" ]; then
                rm -f "$json_file" 2>/dev/null && {
                    echo -e "   - ${SUCCESS_COLOR}已删除: $(basename "$json_file")${RESET_COLOR}"
                    file_count=$((file_count + 1))
                }
            fi
        done
        
        # 删除.img文件（仅当前目录）
        for img_file in "$target_path"*.img; do
            if [ -f "$img_file" ]; then
                rm -f "$img_file" 2>/dev/null && {
                    echo -e "   - ${SUCCESS_COLOR}已删除: $(basename "$img_file")${RESET_COLOR}"
                    file_count=$((file_count + 1))
                }
            fi
        done
    else
        echo -e "   - ${FAIL_COLOR}路径不存在: $target_path${RESET_COLOR}"
    fi
done

if [ $file_count -eq 0 ]; then
    echo -e "   - ${FAIL_COLOR}未找到需要清理的.sh、.json或.img文件${RESET_COLOR}"
else
    echo -e "   - ${SUCCESS_COLOR}共删除 $file_count 个文件${RESET_COLOR}"
fi

# 清空输出，保持界面整洁
clear

# 系统配置调整
echo -e "\n=== 系统配置调整 ==="
# 1. 清理隐藏API政策
echo "1. 执行API政策优化..."
settings delete global hidden_api_policy 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}优化完成${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}无需优化${RESET_COLOR}"
settings delete global hidden_api_policy_p_apps 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}优化完成${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}无需优化${RESET_COLOR}"
settings delete global hidden_api_policy_pre_p_apps 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}优化完成${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}无需优化${RESET_COLOR}"
settings delete global hidden_api_blacklist_exemptions 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}优化完成${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}无需优化${RESET_COLOR}"

# 2. 设置SELinux严格模式
echo -e "\n2. 执行系统安全模式配置..."
if setenforce 1 2>/dev/null; then
    echo -e "   - ${SUCCESS_COLOR}安全模式配置完成${RESET_COLOR}"
else
    echo -e "   - ${FAIL_COLOR}安全模式配置失败（需扩展包/root权限）${RESET_COLOR}"
fi

# 3. 禁用ADB调试相关功能
echo -e "\n3. 禁用ADB调试功能..."
setprop sys.usb.adb.disabled "" 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}ADB调试已禁用${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}ADB调试禁用失败${RESET_COLOR}"
setprop persist.security.adbinput "" 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}ADB输入已禁用${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}ADB输入禁用失败${RESET_COLOR}"
setprop persist.service.adb.enable "" 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}ADB服务已禁用${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}ADB服务禁用失败${RESET_COLOR}"
setprop persist.security.adbinstall "" 2>/dev/null && echo -e "   - ${SUCCESS_COLOR}ADB安装已禁用${RESET_COLOR}" || echo -e "   - ${FAIL_COLOR}ADB安装禁用失败${RESET_COLOR}"

# 4. 开启Tricky Store强制模式（增加确认选项）
echo -e "\n=== 第四部分：开启Tricky Store强制模式 ==="
echo -e "${GOLD_COLOR}提示：强制模式用于TEE真死或者假死的设备${RESET_COLOR}"
read -p "是否开启Tricky Store强制模式？(y/n，默认n): " confirm_ts
if [ "$confirm_ts" = "y" ] || [ "$confirm_ts" = "Y" ]; then
    TARGET_FILE="/data/adb/tricky_store/target.txt"
    if mkdir -p "/data/adb/tricky_store" 2>/dev/null; then
        echo "com.google.android.gms!" > "$TARGET_FILE"
        echo "com.android.vending!" >> "$TARGET_FILE"
        pm list packages -3 | sed -n 's/^package://p' | sed 's/$/!/' >> "$TARGET_FILE" 2>/dev/null
        echo -e "   - ${SUCCESS_COLOR}Tricky Store强制模式已开启${RESET_COLOR}"
    else
        echo -e "   - ${FAIL_COLOR}Tricky Store目录创建失败${RESET_COLOR}"
    fi
else
    echo -e "   - ${FAIL_COLOR}已跳过开启Tricky Store强制模式${RESET_COLOR}"
fi

# 5. 删除指定文件类型（修复确认删除逻辑）
echo -e "\n=== 第五部分：清理特定类型文件 ==="
echo -e "${GOLD_COLOR}扫描范围说明：${RESET_COLOR}"
echo -e "   - /storage/emulated/0/ 根目录下的文件"
echo -e "   - /storage/emulated/0/Download/ 目录及其所有子目录下的文件"
echo -e "${GOLD_COLOR}将删除以下类型文件：.img, .sh, .lua, .json, .xml${RESET_COLOR}"
echo -e "${GOLD_COLOR}注意：Download目录会递归扫描所有子目录${RESET_COLOR}"

# 先扫描并显示找到的文件
file_extensions=("img" "sh" "lua" "json" "xml")
found_files=()
total_files=0

echo -e "\n${GOLD_COLOR}扫描文件...${RESET_COLOR}"

# 扫描 /storage/emulated/0/ 根目录（不递归）
if [ -d "/storage/emulated/0/" ]; then
    echo -e "扫描路径: /storage/emulated/0/ (根目录)"
    for ext in "${file_extensions[@]}"; do
        while IFS= read -r -d '' file; do
            if [ -f "$file" ]; then
                found_files+=("$file")
                echo -e "   - 找到: $(basename "$file")"
                total_files=$((total_files + 1))
            fi
        done < <(find "/storage/emulated/0/" -maxdepth 1 -type f -name "*.$ext" -print0 2>/dev/null)
    done
else
    echo -e "   - ${FAIL_COLOR}路径不存在: /storage/emulated/0/${RESET_COLOR}"
fi

# 扫描 /storage/emulated/0/Download/ 目录及其所有子目录（递归）
if [ -d "/storage/emulated/0/Download/" ]; then
    echo -e "扫描路径: /storage/emulated/0/Download/ (递归所有子目录)"
    for ext in "${file_extensions[@]}"; do
        while IFS= read -r -d '' file; do
            if [ -f "$file" ]; then
                found_files+=("$file")
                # 显示相对路径，便于识别文件位置
                relative_path="${file#/storage/emulated/0/Download/}"
                if [ "$relative_path" != "$file" ]; then
                    echo -e "   - 找到: Download/$relative_path"
                else
                    echo -e "   - 找到: $(basename "$file")"
                fi
                total_files=$((total_files + 1))
            fi
        done < <(find "/storage/emulated/0/Download/" -type f -name "*.$ext" -print0 2>/dev/null)
    done
else
    echo -e "   - ${FAIL_COLOR}路径不存在: /storage/emulated/0/Download/${RESET_COLOR}"
fi

if [ $total_files -eq 0 ]; then
    echo -e "   - ${FAIL_COLOR}未找到匹配的文件${RESET_COLOR}"
    echo -e "   - ${FAIL_COLOR}已跳过文件清理${RESET_COLOR}"
else
    echo -e "\n${GOLD_COLOR}扫描完成，共找到 $total_files 个文件${RESET_COLOR}"
    
    # 显示文件分类统计
    declare -A ext_count
    for file in "${found_files[@]}"; do
        ext="${file##*.}"
        ((ext_count["$ext"]++))
    done
    
    echo -e "${GOLD_COLOR}文件类型统计：${RESET_COLOR}"
    for ext in "${file_extensions[@]}"; do
        count=${ext_count["$ext"]:-0}
        if [ $count -gt 0 ]; then
            echo -e "   - .$ext: $count 个"
        fi
    done
    
    # 重要：在显示文件列表后，让用户确认是否删除
    echo -e "\n${GOLD_COLOR}=== 重要确认 ===${RESET_COLOR}"
    echo -e "${SUCCESS_COLOR}以上列出了所有找到的文件，请仔细检查！${RESET_COLOR}"
    echo -e "${SUCCESS_COLOR}确认删除后这些文件将无法恢复！${RESET_COLOR}"
    
    # 这里必须等待用户输入
    echo -e "${GOLD_COLOR}是否确认删除以上所有文件？(y/n，默认n): ${RESET_COLOR}"
    read confirm_delete
    
    if [ "$confirm_delete" = "y" ] || [ "$confirm_delete" = "Y" ]; then
        file_count=0
        echo -e "\n${GOLD_COLOR}开始删除文件...${RESET_COLOR}"
        for file in "${found_files[@]}"; do
            if [ -f "$file" ]; then
                rm -f "$file" 2>/dev/null && {
                    # 显示相对路径，便于识别删除的文件位置
                    if [[ "$file" == /storage/emulated/0/Download/* ]]; then
                        relative_path="${file#/storage/emulated/0/Download/}"
                        echo -e "   - ${SUCCESS_COLOR}已删除: Download/$relative_path${RESET_COLOR}"
                    else
                        echo -e "   - ${SUCCESS_COLOR}已删除: $(basename "$file")${RESET_COLOR}"
                    fi
                    file_count=$((file_count + 1))
                } || {
                    echo -e "   - ${FAIL_COLOR}删除失败: $(basename "$file")${RESET_COLOR}"
                }
            fi
        done
        
        echo -e "\n${GOLD_COLOR}删除完成${RESET_COLOR}"
        if [ $file_count -eq 0 ]; then
            echo -e "   - ${FAIL_COLOR}未成功删除任何文件${RESET_COLOR}"
        else
            echo -e "   - ${SUCCESS_COLOR}成功删除 $file_count/$total_files 个文件${RESET_COLOR}"
        fi
    else
        echo -e "   - ${FAIL_COLOR}已取消文件清理${RESET_COLOR}"
    fi
fi

echo -e "\n${SUCCESS_COLOR}所有操作完成，请返回春秋检测查看${RESET_COLOR}"