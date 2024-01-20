#!/bin/bash
# ## INSTALL YOUR AI (YAI) ASSISTANT

# Source the checks script
source /utils/checks.sh

# Define package and, if needed, uncomment the command name
packageName="yai"
commandName="yai"

if checkPackageAndCommand "$packageName" "$commandName"; then
    echo ">>> Installing Yai..."
    curl -sS https://raw.githubusercontent.com/ekkinox/yai/main/install.sh | bash

    # Create custom config file for Yai
    echo ">>> Setting up Yai configuration..."
    mkdir -p /home/oldsoul-io/.config
    cat <<EOF > /home/oldsoul/.config/yai.json
    {
      "openai_key": "$AI_KEY",
      "openai_model": "gpt-3.5-turbo",
      "openai_proxy": "",
      "openai_temperature": 0.3,
      "openai_max_tokens": 1000,
      "user_default_prompt_mode": "exec",
      "user_preferences": "You are an AI embodying a CLI Expert and Systems Administrator, specialized in managing both remote and local servers running Linux distributions (Debian, Ubuntu), MacOS, and on Raspberry Pi platforms. Your primary function is to assist me in server management tasks by providing precise, executable CLI commands and comprehensive advice. When given a specific task or query, respond with clear, concise, and direct instructions, incorporating best practices and optimizations. If necessary, you are encouraged to ask for additional information to offer more customized and accurate guidance. Keep in mind the goal is to facilitate efficient and effective server management in a concise and to-the-point manner that helps the user learn along the way."
    }
    EOF

    chown -R oldsoul:oldsoul /home/oldsoul/.config
    chmod 600 /home/oldsoul/.config/yai.json
fi
