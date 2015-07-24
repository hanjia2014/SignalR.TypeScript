TypeScript declarations generator for SignalR
=============================================

# What

You might want to write your SignalR client code in TypeScript instead of JavaScript for obvious reasons. 

This tool generates TypeScript declarations files for your SignalR hubs

# Why

Some of the benefits are:

* Dev/build time type checking. This is especially helpful when the churn in your code is high
* Better tooling support. While intellisense for JavaScript is getting better, it's not on par with TypeScript

# Installation

* Install SRTS NuGet package
* types.tt and signalr.d.ts files will be added to your project. You can move them / rename them if you want
* Definition of your types will be plcaced in types.d.ts file.  You can reference this file from your .ts files
* A basic piece "starter" code is provided on top of types.d.ts file.  You can copy paste this code to your .ts file

# Using command line tool 

* srts.exe installed in project packages folder (installed with the srts NuGet package,) and can be taken from there
* Copy srts.exe to the folder where your assembly is in 
* Run "srts.exe ASSEMBLYNAME.DLL > myTypes.d.ts"

# Features

In addition to supporting all basic types, SRTS also supports:

* Tuple
* Nullable types
* Task results
* List, IEnumerable, etc.
* Dictionary, etc.
* Enums
* Custom classes/interfaces

# Possible issues/limitations

# How to build SRTS

# Sample output (JabbR)

// AUTO GENERATED - DO NOT EDIT MANUALLY
// Assembly File:D:\src\JabbR\JabbR\bin\JabbR.dll

	/* Sample code -- create a .ts file, and paste the following to get started

		/// <reference path="types.d.ts" />
		/// <reference path="signalr.d.ts" />

		// Proxies 
		var monitor: IMonitorProxy = (<any>$.connection).monitor;
		var chat: IChatProxy = (<any>$.connection).chat;

		// Client implementations go here... add some functions.
		monitor.client = { 

		};
		chat.client = { 

		};

		$.connection.hub.start().done((a) => {
			// alert('connected.'); 
			// (do something) 
		});

	*/

	// Client interfaces. These are the return types for the proxies.
	// Implement these in your .ts file, but do not manually edit them here. 
	interface IMonitorClient { }
	interface IChatClient { }

	// Data interfaces 
	interface ClientMessage {
		Id: string;
		Content: string;
		Room: string;
	}
	interface UserViewModel {
		Name: string;
		Hash: string;
		Active: boolean;
		Status: string;
		Note: string;
		AfkNote: string;
		IsAfk: boolean;
		Flag: string;
		Country: string;
		LastActivity: string;
		IsAdmin: boolean;
	}
	interface LobbyRoomViewModel {
		Name: string;
		Count: number;
		Private: boolean;
		Closed: boolean;
		Topic: string;
	}
	interface MessageViewModel {
		HtmlEncoded: boolean;
		Id: string;
		Content: string;
		HtmlContent: string;
		When: string;
		User: UserViewModel;
		MessageType: number;
		UserRoomPresence: string;
		ImageUrl: string;
		Source: string;
	}
	interface RoomViewModel {
		Name: string;
		Count: number;
		Private: boolean;
		Topic: string;
		Closed: boolean;
		Welcome: string;
		Users: Array<UserViewModel>;
		Owners: Array<string>;
		RecentMessages: Array<MessageViewModel>;
	}
	interface ClientNotification {
		Room: string;
		ImageUrl: string;
		Source: string;
		Content: string;
	}

	// Hub interfaces 
	interface IMonitor {
	}
	interface IChat {
		onConnected(): IPromise<void>;
		join(): IPromise<void>;
		join(reconnecting: boolean): IPromise<void>;
		send(content: string, roomName: string): IPromise<boolean>;
		send(clientMessage: ClientMessage): IPromise<boolean>;
		getUserInfo(): IPromise<UserViewModel>;
		onReconnected(): IPromise<void>;
		onDisconnected(): IPromise<void>;
		getCommands(): IPromise<any>;
		getShortcuts(): IPromise<any>;
		getRooms(): IPromise<Array<LobbyRoomViewModel>>;
		getPreviousMessages(messageId: string): IPromise<Array<MessageViewModel>>;
		loadRooms(roomNames: Array<any>): IPromise<void>;
		getRoomInfo(roomName: string): IPromise<RoomViewModel>;
		postNotification(notification: ClientNotification): IPromise<void>;
		postNotification(notification: ClientNotification, executeContentProviders: boolean): IPromise<void>;
		typing(roomName: string): IPromise<void>;
		updateActivity(): IPromise<void>;
		tabOrderChanged(tabOrdering: Array<any>): IPromise<void>;
	}

	// Generetated proxies 
	interface IMonitorProxy {
		 server: IMonitor;
		 client: IMonitorClient;
	}
	interface IChatProxy {
		 server: IChat;
		 client: IChatClient;
	}
