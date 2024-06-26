#!/bin/bash
# renders a manifest file for the Slack app

function renderManifest {
    out="slack_app_manifest.yaml"

    printf '%s\n' \
        "display_information:" \
        "  name: incident-bot" \
        "  description: Incident Bot helps run incidents." \
        "  background_color: '#000a47'" \
        "features:" \
        "  app_home:" \
        "    home_tab_enabled: true" \
        "    messages_tab_enabled: true" \
        "    messages_tab_read_only_enabled: true" \
        "  bot_user:" \
        "    display_name: incident-bot" \
        "    always_online: false" \
        "  shortcuts:" \
        "      - name: Provide incident update" \
        "        type: global" \
        "        callback_id: open_incident_general_update_modal" \
        "        description: Provides a status update regarding an incident to the incidents channel." \
        "      - name: Start a new incident" \
        "        type: global" \
        "        callback_id: open_incident_modal" \
        "        description: Creates a new incident." \
        "      - name: Incident Bot Pager" \
        "        type: global" \
        "        callback_id: open_incident_bot_pager" \
        "        description: Allows you to page a team in a supported upstream provider when running incidents via Incident Bot." \
        "      - name: Manage Incident Timeline" \
        "        type: global" \
        "        callback_id: open_incident_bot_timeline" \
        "        description: Allows you to manage an incident's timeline." \
        "oauth_config:" \
        "  scopes:" \
        "    user:" \
        "      - files:write" \
        "    bot:" \
        "      - app_mentions:read" \
        "      - channels:history" \
        "      - channels:join" \
        "      - channels:manage" \
        "      - channels:read" \
        "      - chat:write" \
        "      - commands" \
        "      - files:read" \
        "      - files:write" \
        "      - groups:history" \
        "      - groups:read" \
        "      - groups:write" \
        "      - im:read" \
        "      - im:write" \
        "      - mpim:read" \
        "      - mpim:write" \
        "      - pins:write" \
        "      - reactions:read" \
        "      - reactions:write" \
        "      - usergroups:read" \
        "      - users:read" \
        "      - users:read.email" \
        "settings:" \
        "  event_subscriptions:" \
        "    bot_events:" \
        "      - app_home_opened" \
        "      - app_mention" \
        "      - message.channels" \
        "      - reaction_added" \
        "  interactivity:" \
        "    is_enabled: true" \
        "  org_deploy_enabled: false" \
        "  socket_mode_enabled: true" \
        "  token_rotation_enabled: false" > ${out}
}

function main {
    renderManifest
    echo "Wrote manifest to: ${out}"
}

main
