import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Message extends Equatable {
  List<Recipient> bccRecipients;
  Body body;
  List<Recipient> ccRecipients;
  Recipient from;
  bool hasAttachments;
  String id;
  String importance;
  bool isDeliveryReceiptRequested;
  bool isDraft;
  bool isRead;
  bool isReadReceiptRequested;
  String lastModifiedDateTime;
  String parentFolderId;
  String receivedDateTime;
  List<Recipient> replyTo;
  Recipient sender;
  String sentDateTime;
  String subject;
  List<Recipient> toRecipients;
  List<Attachments> attachments;

  Message(
      {this.bccRecipients,
      this.body,
      this.ccRecipients,
      this.from,
      this.hasAttachments,
      this.id,
      this.importance,
      this.isDeliveryReceiptRequested,
      this.isDraft,
      this.isRead,
      this.isReadReceiptRequested,
      this.lastModifiedDateTime,
      this.receivedDateTime,
      this.replyTo,
      this.sender,
      this.subject,
      this.toRecipients,
      this.attachments});
  @override
  String toString() {}

  Message.fromJson(Map<String, dynamic> json) {
    if (json['bccRecipients'] != null) {
      bccRecipients = new List<Recipient>();
      json['bccRecipients'].forEach((v) {
        bccRecipients.add(new Recipient.fromJson(v));
      });
    }
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    if (json['ccRecipients'] != null) {
      ccRecipients = new List<Recipient>();
      json['ccRecipients'].forEach((v) {
        ccRecipients.add(new Recipient.fromJson(v));
      });
    }
    from = json['from'] != null ? new Recipient.fromJson(json['from']) : null;
    hasAttachments = json['hasAttachments'];
    id = json['id'];
    importance = json['importance'];
    isDeliveryReceiptRequested = json['isDeliveryReceiptRequested'];
    isDraft = json['isDraft'];
    isRead = json['isRead'];
    isReadReceiptRequested = json['isReadReceiptRequested'];
    receivedDateTime = json['receivedDateTime'];
    if (json['replyTo'] != null) {
      replyTo = new List<Recipient>();
      json['replyTo'].forEach((v) {
        replyTo.add(new Recipient.fromJson(v));
      });
    }
    sender =
        json['sender'] != null ? new Recipient.fromJson(json['sender']) : null;
    subject = json['subject'];
    if (json['toRecipients'] != null) {
      toRecipients = new List<Recipient>();
      json['toRecipients'].forEach((v) {
        toRecipients.add(new Recipient.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bccRecipients != null) {
      data['bccRecipients'] =
          this.bccRecipients.map((v) => v.toJson()).toList();
    }
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    if (this.ccRecipients != null) {
      data['ccRecipients'] = this.ccRecipients.map((v) => v.toJson()).toList();
    }
    if (this.from != null) {
      data['from'] = this.from.toJson();
    }
    if (this.hasAttachments != null) {
      data['hasAttachments'] = this.hasAttachments;
    }
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.importance != null) {
      data['importance'] = this.importance;
    }
    if (this.isDeliveryReceiptRequested != null) {
      data['isDeliveryReceiptRequested'] = this.isDeliveryReceiptRequested;
    }
    if (this.isDraft != null) {
      data['isDraft'] = this.isDraft;
    }
    if (this.isRead != null) {
      data['isRead'] = this.isRead;
    }
    if (this.isReadReceiptRequested != null) {
      data['isReadReceiptRequested'] = this.isReadReceiptRequested;
    }
    if (this.receivedDateTime != null) {
      data['receivedDateTime'] = this.receivedDateTime;
    }
    if (this.replyTo != null) {
      data['replyTo'] = this.replyTo.map((v) => v.toJson()).toList();
    }
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject;
    }
    if (this.toRecipients != null) {
      data['toRecipients'] = this.toRecipients.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Body extends Equatable {
  String contentType;
  String content;

  Body({this.contentType, this.content});

  Body.fromJson(Map<String, dynamic> json) {
    contentType = json['contentType'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentType'] = this.contentType;
    data['content'] = this.content;
    return data;
  }
}

class Flag extends Equatable {
  String odataType;

  Flag({this.odataType});

  Flag.fromJson(Map<String, dynamic> json) {
    odataType = json['@odata.type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@odata.type'] = this.odataType;
    return data;
  }
}

class Attachments {
  String odataType;

  Attachments({this.odataType});

  Attachments.fromJson(Map<String, dynamic> json) {
    odataType = json['@odata.type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@odata.type'] = this.odataType;
    return data;
  }
}

class Recipient {
  EmailAddress emailAddress;
  Recipient({this.emailAddress});
  Recipient.fromJson(Map<String, dynamic> json) {
    emailAddress = json['emailAddress'] != null
        ? new EmailAddress.fromJson(json['emailAddress'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.emailAddress != null) {
      data['emailAddress'] = this.emailAddress.toJson();
    }
    return data;
  }
}

class EmailAddress {
  String address;
  String name;
  EmailAddress({@required this.address, this.name});
  EmailAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['address'] = this.address;
    if (this.name != null) {
      data['name'] = this.name;
    }
    return data;
  }
}
